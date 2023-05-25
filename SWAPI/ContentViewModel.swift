//
//  ContentViewModel.swift
//  SWAPI
//
//  Created by Travis Brigman on 1/28/23.
//

import Foundation

struct MenuItem {
    var name: String
    var state: Bool
}

@MainActor
class ContentViewModel: ObservableObject {
    enum State {
        case idle
        case loading
        case failed(Error)
        case loaded(ResponseData)
    }
    
    @Published private(set) var state = State.idle
    @Published var isPresentingSheet = false
    @Published var toppingsArray = [
    MenuItem(name: "Sprinkles", state: false),
    MenuItem(name: "Cherry", state: false),
    MenuItem(name: "Whipped Cream", state: false)
    ]
    
    let reqresService: ReqresService
    init(state: State = State.idle, reqresService: ReqresService) {
        self.state = state
        self.reqresService = reqresService
    }
    
    func postSuccessfulScan(successfulResult: MyScanResult) {
        var serialNumber = ""
        
        if successfulResult.type == .qr {
            let STBDetails = successfulResult.string.components(separatedBy: ",")
            guard STBDetails.count == 3 else { return }
            serialNumber = String(STBDetails[0].dropFirst(7))
        } else if successfulResult.type == .code128 {
            serialNumber = successfulResult.string
        }
        
        // Post Stuff...
    }
    
    func handleSheetAction() {
        isPresentingSheet = false
    }
    
    func makePost() async throws {
        let body = PostModel(name: "Sorrel", job: "Wife")
        try await reqresService.sendRequest(endpoint: ReqresEndpoint.create(model: body), responseModel: PostResponseModel.self)
    }
    
    func load() {
        state = .loading
        Task {
            do {
                self.state = .loaded(try await reqresService.getAllData())
            } catch {
                print(error.localizedDescription)
            }
            
        }

    }
    
}
