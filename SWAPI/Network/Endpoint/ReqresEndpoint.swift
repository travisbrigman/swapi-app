//
//  ReqresEndpoint.swift
//  SWAPI
//
//  Created by Travis Brigman on 2/9/23.
//

import Foundation

enum ReqresEndpoint {
    case data
    case create(model: Body)
}

extension ReqresEndpoint: Endpoint {
    
    var host: String {
        switch self {
        case .data, .create:
            return "reqres.in"
        }
    }
    
    var path: String {
        switch self {
        case .data:
            return "/api/{resource}"
        case .create:
            return "/api/users"
        }
    }
    
    var method: RequestMethod {
        switch self {
        case .data:
            return .get
        case .create(let data):
            return .post(encoding: data)
        }
    }
    
    var header: [String : String]? {
        switch self {
        case .data, .create:
            return [
                "Content-Type": "application/json;charset=utf-8"
            ]
        }
    }
    
    var body: PostModel? {
        switch self {
        case .data:
            return nil
        case .create(model: let model):
            return model
        }
    }
    
    var query: [URLQueryItem]? {
        switch self {
        case .data, .create:
            return nil
        }
    }
    
}
