//
//  QRData.swift
//  PaymentSDK
//
//  Created by Tung Nguyen on 5/22/20.
//

import Foundation

public class Transaction {
    public var code: String
    public var qrContent: String
    
    public init(code: String, qrContent: String) {
        self.code = code
        self.qrContent = qrContent
    }
}
