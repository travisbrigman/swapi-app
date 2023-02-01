//
//  ContentView.swift
//  SWAPI
//
//  Created by Travis Brigman on 1/28/23.
//

import SwiftUI

struct ContentView: View {
    @StateObject var vm = ContentViewModel(filmService: FilmService())
    
    var body: some View {
//        AsyncContentView(source: vm) { allReleases in
            VStack {
                List {
                    ForEach(vm.allReleases?.films ?? [Film]() ){ film in
                        Text(film.title)
                    }
                }
                Text("\(vm.allReleases?.count ?? 0)")
            }.task {
                do {
                    try await vm.loadFilmList()
                } catch {
                    print(error.localizedDescription)
                }
            }
//        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
