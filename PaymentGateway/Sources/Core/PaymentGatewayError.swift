//
//  PaymentError.swift
//  PaymentSDK
//
//  Created by Tung Nguyen on 5/20/20.
//

import Foundation

public class PaymentGatewayError: Error {

    var message: String
        
    init(_ message: String) {
        self.message = message
    }
    
}

public enum TransactionError: String, Error {
    
    // Common errors
    case system = "99"
    case invalidChecksum = "01"
    case missingParams = "02"
    case invalidDataFormat = "03"
    case invalidData = "04"
    case unauthorizedIp = "05"
    case timeout = "06"
    case unexpected = "07"
    
    // Merchant errors
    case invalidTerminal = "100"
    case invalidClientCode = "101"
    case conflictTerminalAndClientCode = "102"
    case invalidMerchantMethod = "103"
    case invalidMerchantMethodCode = "104"
    case invalidPaymentMethod = "105"
    case invalidOrderCode = "106"
    case invalidAmount = "107"
    case existedTransaction = "108"
    case invalidMerchant = "109"
    case merchantBlocked = "110"
    case maintenancing = "111"
    
    // VNPAY-CTT
    
    // VNPAY-QR
    
}
