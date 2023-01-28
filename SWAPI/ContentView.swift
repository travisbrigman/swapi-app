//
//  ContentView.swift
//  SWAPI
//
//  Created by Travis Brigman on 1/28/23.
//

import SwiftUI

struct ContentView: View {
    @StateObject var vm = ContentViewModel(filmService: FilmService())
    
    var defaultFilm = Film(title: "test", episodeID: 0, openingCrawl: "Crawl", director: "director", producer: "director", releaseDate: "1977", characters: ["CharacterArray"], planets: ["PlanetsArray"], starships: ["Starship"], vehicles: ["Vehicles"], species: ["SpeciesArray"], created: "Created", edited: "Edited", url: "URLstring")
    
    var body: some View {
        VStack {
            List {
                ForEach(vm.allReleases?.films ?? [defaultFilm]){ film in
                    Text(film.title)
                }
            }
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
