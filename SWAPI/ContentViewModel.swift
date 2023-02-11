//
//  ContentViewModel.swift
//  SWAPI
//
//  Created by Travis Brigman on 1/28/23.
//

import Foundation
import SwiftUI

class ContentViewModel: ObservableObject, LoadableObject {
    let dataStore: DataStore
    typealias Output = ResponseData
    
    init(dataStore: DataStore) {
        self.dataStore = dataStore
    }
    
    var state: LoadingState<Output> = .idle
    
    func load() {
        state = .loading
        Task {
            try await Task.sleep(nanoseconds: UInt64(5.0 * Double(NSEC_PER_SEC)))
            do {
                try await dataStore.getReqresData()
            } catch {
                print(error.localizedDescription)
            }
            state = .loaded(dataStore.responseData ?? ResponseData(page: 0, perPage: 0, total: 0, totalPages: 0, data: [], support: Support(url: "", text: "")))
            print("state should be loaded")
        }

    }
    
}

/// https://www.swiftbysundell.com/articles/handling-loading-states-in-swiftui/
///
enum LoadingState<Value> {
    case idle
    case loading
    case failed(Error)
    case loaded(Value)
}

protocol LoadableObject: ObservableObject {
    associatedtype Output
    var state: LoadingState<Output> { get }
    func load()
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
            Color.clear.onAppear(perform: source.load)
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
