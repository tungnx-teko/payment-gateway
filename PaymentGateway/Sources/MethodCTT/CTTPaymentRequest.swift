//
//  CTTPaymentRequest.swift
//  Pods
//
//  Created by Tung Nguyen on 6/30/20.
//

import Foundation

public class CTTPaymentRequest: BasePaymentRequest {
    public var orderId: String
    public var orderCode: String
    public var amount: Double
    
    public init(orderId: String, orderCode: String, amount: Double) {
        self.orderId = orderId
        self.orderCode = orderCode
        self.amount = amount
    }
}
