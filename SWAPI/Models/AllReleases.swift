//
//  Film.swift
//  SWAPI
//
//  Created by Travis Brigman on 1/28/23.
//

import Foundation

struct AllReleases: Codable {
    let count: Int


    let films: [Film]
    
    enum CodingKeys: String, CodingKey {
        case count
        case films = "results"
    }
}
