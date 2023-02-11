//
//  ReqresService.swift
//  SWAPI
//
//  Created by Travis Brigman on 2/9/23.
//

import Foundation
import SwiftUI

protocol ReqresServicable {
    func getAllData() async throws -> ResponseData
}

struct ReqresService: HTTPClient, ReqresServicable {
    
    func getAllData() async throws -> ResponseData {
        do {
            return try await sendRequest(endpoint: ReqresEndpoint.data, responseModel: ResponseData.self)
        } catch {
            throw error
        }
    }
}
