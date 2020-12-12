//
//  QRCodeError.swift
//  QRCode
//
//  Created by Yonatan Tovim on 12/12/2020.
//

import Foundation

enum QRCodeError: String, Error {
    case decoding = "Invalid QR Code!"
    
    var errorMessage: String {
        switch self {
        case .decoding:
            return "We couldn't recognize the QR Code."
        }
    }
}
