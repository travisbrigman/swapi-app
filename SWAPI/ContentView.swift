//
//  ContentView.swift
//  SWAPI
//
//  Created by Travis Brigman on 1/28/23.
//

import SwiftUI

struct ContentView: View {
    @StateObject private var vm: ContentViewModel

    init(dataStore: DataStore) {
        let vm = ContentViewModel(dataStore: dataStore)
        _vm = StateObject(wrappedValue: vm)
    }
    
    var body: some View {
        AsyncContentView(source: vm) { responsData in
            VStack {
                List {
                    ForEach(responsData.data ){ data in
                        Text(data.name)
                    }
                }
                Text("\(responsData.data.count)")
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(dataStore: DataStore(reqResService: ReqresService()))
    }
}
