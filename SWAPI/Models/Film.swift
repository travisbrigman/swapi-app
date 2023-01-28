//
//  Film.swift
//  SWAPI
//
//  Created by Travis Brigman on 1/28/23.
//

import Foundation

struct Film: Codable {
    let title: String
    let episodeID: Int
    let openingCrawl, director, producer, releaseDate: String
    let characters, planets, starships, vehicles: [String]
    let species: [String]
    let created, edited: String
    let url: String

    enum CodingKeys: String, CodingKey {
        case title
        case episodeID
        case openingCrawl
        case director, producer
        case releaseDate
        case characters, planets, starships, vehicles, species, created, edited, url
    }
}

extension Film: Identifiable {
    var id: Int { episodeID }
}
