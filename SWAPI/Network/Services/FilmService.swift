//
//  FilmService.swift
//  SWAPI
//
//  Created by Travis Brigman on 1/28/23.
//

import Foundation

protocol FilmServicable {
    func getAllFilms() async throws -> AllReleases
}

struct FilmService: HTTPClient, FilmServicable {
    func getAllFilms() async throws -> AllReleases {
        do {
            return try await sendRequest(endpoint: FilmsEndPoint.films, responseModel: AllReleases.self)
        } catch {
            print("getFilms error: ", error)
            throw error
        }
    }
}
