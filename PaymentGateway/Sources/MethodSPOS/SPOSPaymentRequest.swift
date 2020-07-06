//
//  SPOSPaymentRequest.swift
//  Pods
//
//  Created by Tung Nguyen on 6/30/20.
//

import Foundation

public class SPOSPaymentRequest: BasePaymentRequest {
    public let orderId: String
    public let orderCode: String
    public let amount: Double
    public var partnerCode: String = "VNPAY"
    
    public init(orderId: String, orderCode: String, amount: Double, partnerCode: String) {
        self.orderId = orderId
        self.orderCode = orderCode
        self.amount = amount
        self.partnerCode = partnerCode
    }
}
