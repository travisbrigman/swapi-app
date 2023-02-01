//
//  ContentViewModel.swift
//  SWAPI
//
//  Created by Travis Brigman on 1/28/23.
//

import Foundation
import SwiftUI

enum LoadingState<Value> {
        case idle
        case loading
        case failed(Error)
        case loaded(Value)
    }

protocol LoadableObject: ObservableObject {
    associatedtype Output
    var state: LoadingState<Output> { get }
    func load() async throws
}


class ContentViewModel: ObservableObject, LoadableObject {
    let filmService: FilmService
    
    @Published var allReleases: AllReleases?
    typealias Output = AllReleases
    
    var state: LoadingState<Output> = .idle
    
    init(allReleases: AllReleases? = nil, filmService: FilmService) {
        self.allReleases = allReleases
        self.filmService = filmService
    }
    
    
    func load() async throws {
        state = .loading
        self.allReleases = try await filmService.getAllFilms()
        state = .loaded(self.allReleases ?? AllReleases(count: 0, films: [Film]()))
    }
    
}


struct AsyncContentView<Source: LoadableObject, Content: View>: View {
    @ObservedObject var source: Source
    var content: (Source.Output) -> Content
    
    init(source: Source,
         @ViewBuilder content: @escaping (Source.Output) -> Content) {
        self.source = source
        self.content = content
    }

    var body: some View {
        switch source.state {
        case .idle:
            Color.clear.task { try? await source.load() }
        case .loading:
            ProgressView()
        case .failed(let error):
//            ErrorView(error: error, retryHandler: source.load) //<-- code from article
            Text("\(error.localizedDescription)")
        case .loaded(let output):
            content(output)
        }
    }
}
