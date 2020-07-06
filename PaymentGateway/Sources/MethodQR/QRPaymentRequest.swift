//
//  QRPaymentRequest.swift
//  Alamofire
//
//  Created by Tung Nguyen on 7/2/20.
//

import Foundation

public class QRPaymentRequest: BasePaymentRequest {
    public var orderId: String
    public var orderCode: String
    public var amount: Double
    
    public init(orderId: String, orderCode: String, amount: Double) {
        self.orderId = orderId
        self.orderCode = orderCode
        self.amount = amount
    }
}
