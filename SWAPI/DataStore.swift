//
//  DataStore.swift
//  SWAPI
//
//  Created by Travis Brigman on 2/10/23.
//

import Foundation
import SwiftUI

class DataStore: ObservableObject {
    let reqResService: ReqresService
    
    init(reqResService: ReqresService) {
        self.reqResService = reqResService
    }
    
    @Published var responseData: ResponseData?
    
    func getReqresData() async throws {
        self.responseData = try await reqResService.getAllData()
    }
}
