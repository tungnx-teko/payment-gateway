//
//  PaymentGatewayConfig.swift
//  Pods
//
//  Created by Tung Nguyen on 6/30/20.
//

import Foundation
import TekPaymentService

public class PaymentGatewayConfig {
    public let clientCode: String
    public let terminalCode: String
    public let serviceCode: String
    public let secretKey: String
    public let baseUrl: String
    internal var callbackUrls: [PaymentMethod: PaymentCallbackUrl]
    
    public init(clientCode: String, terminalCode: String, serviceCode: String, secretKey: String, baseUrl: String) {
        self.clientCode = clientCode
        self.terminalCode = terminalCode
        self.serviceCode = serviceCode
        self.secretKey = secretKey
        self.baseUrl = baseUrl
        self.callbackUrls = [:]
    }
    
    public func setCallbackUrl(forMethod method: PaymentMethod, returnUrl: String, cancelUrl: String) {
        let callbackUrl = PaymentCallbackUrl(cancelUrl: cancelUrl, returnUrl: returnUrl)
        callbackUrls[method] = callbackUrl
    }
}
