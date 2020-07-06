//
//  PaymentGateway.swift
//  Pods
//
//  Created by Tung Nguyen on 6/30/20.
//

import Foundation
import TekPaymentService
import FirebaseCore

public class PaymentGateway {
    
    public static let shared = PaymentGateway()
    
    var config: PaymentGatewayConfig! {
        didSet {
            service = PaymentServiceOwner(paymentRawUrl: config.baseUrl,
                                          config: PaymentConfig(secretKey: config.secretKey,
                                                                clientCode: config.clientCode,
                                                                terminalCode: config.terminalCode))
            service.build()
        }
    }
    
    var service: PaymentServiceOwner!
    
    private init() {
        // Config firebase
        
        
    }
    
    public func pay(method: PaymentMethod, request: BasePaymentRequest, completion: @escaping (Result<Transaction, Error>) -> ()) throws {
        guard let _ = config else {
            throw PaymentGatewayError("Missing PaymentGatewayConfig")
        }
        switch method {
        case .qr:
            guard let request = request as? QRPaymentRequest else {
                throw PaymentGatewayError("Payment request not match with method")
            }
            try generateQR(cttRequest: request, completion: { result in completion(result) })
        case .spos:
            guard let request = request as? SPOSPaymentRequest else {
                throw PaymentGatewayError("Payment request not match with method")
            }
            try createSposTransaction(request: request, completion: { result in completion(result) })
        default:
            ()
        }
    }
    
    private func generateQR(cttRequest: QRPaymentRequest,
                            completion: @escaping (Result<Transaction, Error>) -> ()) throws {
        let orderInfo = PaymentOrderInfo(id: cttRequest.orderId, code: cttRequest.orderCode, amount: cttRequest.amount)
        
        service.generateQRCode(paymentOrderInfo: orderInfo, callbackUrl: config.callbackUrls[.qr]) {
            (qrData, error) in
            if let data = qrData {
                let transaction = Transaction(code: data.psTransactionCode.orEmpty, qrContent: data.qrContent.orEmpty)
                completion(.success(transaction))
            } else {
                completion(.failure(error ?? PaymentGatewayError("Unexpected error")))
            }
        }
    }
    
    private func createSposTransaction(request: SPOSPaymentRequest,
                                       completion: @escaping (Result<Transaction, Error>) -> ()) throws {
        let orderInfo = PaymentOrderInfo(id: request.orderId, code: request.orderCode, amount: request.amount)
        
        service.spos(paymentOrderInfo: orderInfo, callbackUrl: config.callbackUrls[.spos]) {
            (qrData, error) in
            if let data = qrData {
                print(data)
            } else {
                completion(.failure(error ?? PaymentGatewayError("Unexpected error")))
            }
        }
    }
    
    public func setConfig(_ config: PaymentGatewayConfig) {
        self.config = config
    }
    
}
