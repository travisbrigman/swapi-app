//
//  FilmsEndPoint.swift
//  SWAPI
//
//  Created by Travis Brigman on 1/28/23.
//

import Foundation

enum FilmsEndPoint {
case films
}

extension FilmsEndPoint: Endpoint {
    var path: String {
        switch self {
        case .films:
            return "/api/films/"
        }
    }
    
    var method: RequestMethod {
        switch self {
        case .films:
            return .get
        }
    }
    
    var header: [String : String]? {
        switch self {
        case .films:
            return [
                "Content-Type": "application/json;charset=utf-8"
            ]
        }
    }
    
    var body: [String : String]? {
        switch self {
        case .films:
            return nil
        }
    }
    
    var query: [URLQueryItem]? {
        switch self {
        case .films:
            return nil
        }
    }
}
