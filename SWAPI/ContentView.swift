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
        
        VStack {
    
            MenuSection(vm: vm)
            

        }
    }
}

struct MenuSection: View {
    @ObservedObject var vm: ContentViewModel
    
    var body: some View {
        Section {
            ForEach($vm.toppingsArray, id: \.name) { $toppinItem in
                Toggle(toppinItem.name, isOn: $toppinItem.state)
            }.padding()
        }
        Button("Show the sheet") {
            vm.isPresentingSheet = true
        }
        .sheet(isPresented: $vm.isPresentingSheet){
            ScannerView(viewModel: vm, isShowingScanner: $vm.isPresentingSheet)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(vm: ContentViewModel(reqresService: ReqresService()))
    }
}
