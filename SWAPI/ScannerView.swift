//
//  ScannerView.swift
//  SWAPI
//
//  Created by Travis Brigman on 5/25/23.
//

import Foundation
import SwiftUI
import CodeScanner

extension ScanError: LocalizedError {
    public var errorDescription: String? {
        switch self {
        case .badInput:
            return "The camera could not be accessed."
        case .badOutput:
            return "The camera was not capable of scanning the requested codes."
        case .initError(_):
            return "Can't open the camera"
        case .permissionDenied:
            return "You need to allow the app to use the camera"
        }
    }
}

struct ScannerView: View {
    @ObservedObject var viewModel: ContentViewModel
    // MARK: - State Variables
    @State var scanError: ScanError?
    @State var showScanError = false
    @Binding var isShowingScanner: Bool
    
    let simulatedResultText = "serial=277933029232101186,versionCode=5006077,versionName=5.6.77"
    
    // MARK: - Functions
    func handleScan(result: Result<MyScanResult, ScanError>) {
        isShowingScanner = false
        switch result {
        case .success(let result):
            viewModel.postSuccessfulScan(successfulResult: result )
        case .failure(let error):
            scanError = error
    }
 }
    // MARK: - Body
    var body: some View {
        ZStack{
            CodeScannerView(codeTypes: [.qr, .code128], simulatedData: simulatedResultText, completion: handleScan)
            #if !targetEnvironment(simulator)
            ZStack {
                Color.black.opacity(0.5)
                VStack {
    
                    HStack {
                        Spacer()
                        Button {
                            isShowingScanner = false
                        } label: {
                            Image(systemName: "x.circle")
                                .resizable()
                                .frame(width: 32.0, height: 32.0)
                                .foregroundColor(.white)
                        }
                    }
                    .padding(.top, 30)
                    .padding(.trailing)
                    .padding()
                    Spacer()
                    RoundedRectangle(cornerRadius: 20)
                        .frame(width: 200, height: 200)
                        .blendMode(.destinationOut)
                    Spacer()
                }
            }
            .compositingGroup()
            .edgesIgnoringSafeArea(.all)
            #endif
        }
        .alert(isPresented: $showScanError, error: scanError ) {_ in} message: { error in Text(error.errorDescription ?? "unknown error") }
    
    }

}

// MARK: - Preview
struct ScannerView_Previews: PreviewProvider {
    static var previews: some View {
        ScannerView(viewModel: ContentViewModel(reqresService: ReqresService()), scanError: .badOutput, isShowingScanner: .constant(true))
    }
}
