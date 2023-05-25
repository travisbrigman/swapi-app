//
//  MyScanResult.swift
//  SWAPI
//
//  Created by Travis Brigman on 5/25/23.
//

import AVFoundation
import UIKit
import CodeScanner

struct MyScanResult {
    public let string: String
    public let type: AVMetadataObject.ObjectType
    public let image: UIImage?
    // This is what you'd use in your production code
    init(scanResult: ScanResult) {
      self.string = scanResult.string
        self.type = scanResult.type
        self.image = scanResult.image
    }

    // This allows you to create random versions in your tests
    init(string: String, type: AVMetadataObject.ObjectType, image: UIImage?) {
      self.string = string
        self.type = type
        self.image = image
    }
}
