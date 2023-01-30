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
        VStack {
            List {
                ForEach(vm.allReleases?.films ?? [defaultFilm]){ film in
                    Text(film.title)
                }
            }
            Text("\(vm.allReleases?.count ?? 0)")
        }
        .padding()
        .task { try? await vm.getAllFilms() }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
