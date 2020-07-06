//
//  PayloadGenerator.swift
//  Pods
//
//  Created by Tung Nguyen on 6/3/20.
//

import Foundation

class PayloadGenerator {
    
    private init() {}
    
    public static let shared = PayloadGenerator()
    
//    func generateTranCreatePayload(order: OrderObject, method: PaymentMethod) -> Payload {
//        var dict = [String: Any]()
//        dict["clientCode"] = Payment.configs.clientCode
//        dict["terminalCode"] = Payment.configs.terminalCode
//        dict["serviceCode"] = Payment.configs.serviceCode
//        dict["returnUrl"] = Payment.configs.returnUrl
//        dict["cancelUrl"] = Payment.configs.cancelUrl
//        dict["partnerCode"] = method.partnerCode
//        dict["bankCode"] = method.bankCode
//        dict["methodCode"] = method.methodCode
//        dict["clientTransactionCode"] = UUID().uuidString.lowercased()
//        dict["orderId"] = order.orderId
//        dict["orderCode"] = order.orderCode
//        dict["orderDescription"] = order.orderDescription
//        dict["amount"] = order.amount
//        dict["clientRequestTime"] = DateUtils.toString(date: Date())
//        dict["checksum"] = MD5Encryptor.encrypt(text: Payment.configs.secretKey + dict.stringify)
//        return dict
//    }
//    
//    func generateTPayConfirmPayload(otp: String, transactionCode: String) -> Payload {
//        var dict = [String: Any]()
//        dict["clientCode"] = Payment.configs.clientCode
//        dict["psTransactionCode"] = transactionCode
//        dict["otp"] = otp
//        dict["checksum"] = MD5Encryptor.encrypt(text: Payment.configs.secretKey + dict.stringify)
//        return dict
//    }
    
}
