//
//  Film.swift
//  SWAPI
//
//  Created by Travis Brigman on 1/28/23.
//

import Foundation

struct AllReleases: Codable {
    let count: Int
    let next: Int?
    let previous: Int?
    let films: [Film]
}
