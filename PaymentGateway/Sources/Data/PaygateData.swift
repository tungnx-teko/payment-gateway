//
//  PaygateData.swift
//  PaymentSDK
//
//  Created by Tung Nguyen on 5/22/20.
//

import Foundation

class PaygateData: Decodable {
    var url: String?
    var transactionCode: String?
    
    enum CodingKeys: String, CodingKey {
        case url
        case transactionCode = "psTransactionCode"
    }
}
