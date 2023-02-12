//
//  ContentView.swift
//  SWAPI
//
//  Created by Travis Brigman on 1/28/23.
//

import SwiftUI

struct ContentView: View {
    @StateObject var vm: ContentViewModel


    
    var body: some View {
        switch vm.state {
        case .loaded(let responseData):
            VStack {
                List {
                    ForEach(responseData.data ){ data in
                        Text(data.name)
                    }
                }
                Text("\(responseData.data.count)")
            }
        case .idle:
            Color.clear.onAppear(perform: vm.load)
        case .loading:
            ProgressView()
        case .failed(_):
            Text("Something Happened")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(vm: ContentViewModel(reqresService: ReqresService()))
    }
}
