//
//  ReqresEndpoint.swift
//  SWAPI
//
//  Created by Travis Brigman on 2/9/23.
//

import Foundation

enum ReqresEndpoint {
case data
}

extension ReqresEndpoint: Endpoint {
    
    var host: String {
        switch self {
        case .data:
            return "reqres.in"
        }
    }
    
    var path: String {
        switch self {
        case .data:
            return "/api/{resource}"
        }
    }
    
    var method: RequestMethod {
        switch self {
        case .data:
            return .get
        }
    }
    
    var header: [String : String]? {
        switch self {
        case .data:
            return [
                "Content-Type": "application/json;charset=utf-8"
            ]
        }
    }
    
    var body: [String : String]? {
        switch self {
        case .data:
            return nil
        }
    }
    
    var query: [URLQueryItem]? {
        switch self {
        case .data:
            return nil
        }
    }
    
}
