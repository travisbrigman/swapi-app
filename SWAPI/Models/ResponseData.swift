//
//  ResponseData.swift
//  SWAPI
//
//  Created by Travis Brigman on 2/9/23.
//

import Foundation

// MARK: - ResponseData
struct ResponseData: Codable, Equatable {
    static func == (lhs: ResponseData, rhs: ResponseData) -> Bool {
        lhs.page == rhs.page
    }
    
    let page, perPage, total, totalPages: Int
    let data: [Datum]
    let support: Support

    enum CodingKeys: String, CodingKey {
        case page
        case perPage = "per_page"
        case total
        case totalPages = "total_pages"
        case data, support
    }
}

// MARK: - Datum
struct Datum: Codable , Identifiable {
    let id: Int
    let name: String
    let year: Int
    let color, pantoneValue: String

    enum CodingKeys: String, CodingKey {
        case id, name, year, color
        case pantoneValue = "pantone_value"
    }
}

// MARK: - Support
struct Support: Codable {
    let url: String
    let text: String
}
