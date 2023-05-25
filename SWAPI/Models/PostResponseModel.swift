//
//  PostResponseModel.swift
//  SWAPI
//
//  Created by Travis Brigman on 3/24/23.
//

import Foundation

struct PostResponseModel: Codable {
    enum CodingKeys: String, CodingKey, CaseIterable {
//        case createdAt
        case id
        case job
        case name
    }

//    let createdAt: Date
    let id: String
    let job: String
    let name: String

    init( id: String, job: String, name: String) {
//        self.createdAt = createdAt
        self.id = id
        self.job = job
        self.name = name
    }
}


