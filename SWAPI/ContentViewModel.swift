//
//  ContentViewModel.swift
//  SWAPI
//
//  Created by Travis Brigman on 1/28/23.
//

import Foundation

@MainActor
class ContentViewModel: ObservableObject {
    @Published var allReleases: AllReleases?
    
    let filmService: FilmService
    
    init(allReleases: AllReleases? = nil, filmService: FilmService) {
        self.allReleases = allReleases
        self.filmService = filmService
    }
    
    func getAllFilms() async throws {
        self.allReleases = try await filmService.getAllFilms()
    }
}
