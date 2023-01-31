//
//  ContentView.swift
//  SWAPI
//
//  Created by Travis Brigman on 1/28/23.
//

import SwiftUI

struct ContentView: View {
    @StateObject var vm = ContentViewModel(filmService: FilmService())
    
    var defaultFilm = Film(title: "test", episodeID: 0)
    
    var body: some View {
        switch vm.state {
        case .idle:
            Color.clear.task { try? await vm.load() }
        case .loading:
                    ProgressView()
        case .loaded(let allReleases):
            VStack {
                List {
                    ForEach(allReleases.films){ film in
                        Text(film.title)
                    }
                }
                Text("\(vm.allReleases?.count ?? 0)")
            }
            .padding()
        case .failed(let error):
            Text(error.localizedDescription)
        }

//        .task { try? await vm.load() }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
