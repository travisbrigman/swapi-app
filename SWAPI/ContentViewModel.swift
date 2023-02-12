//
//  ContentViewModel.swift
//  SWAPI
//
//  Created by Travis Brigman on 1/28/23.
//

import Foundation

@MainActor
class ContentViewModel: ObservableObject {
    enum State {
        case idle
        case loading
        case failed(Error)
        case loaded(ResponseData)
    }
    
    @Published private(set) var state = State.idle
    
    let reqresService: ReqresService
    init(state: State = State.idle, reqresService: ReqresService) {
        self.state = state
        self.reqresService = reqresService
    }
    
    
    func load() {
        state = .loading
        Task {
            try await Task.sleep(nanoseconds: UInt64(5.0 * Double(NSEC_PER_SEC)))
            do {
                self.state = .loaded(try await reqresService.getAllData())
            } catch {
                print(error.localizedDescription)
            }
            
        }

    }
    
}

/// https://www.swiftbysundell.com/articles/handling-loading-states-in-swiftui/
