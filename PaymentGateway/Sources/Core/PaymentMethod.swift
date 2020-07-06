//
//  PaymentMethod.swift
//  Pods
//
//  Created by Tung Nguyen on 6/3/20.
//

import Foundation

public enum PaymentMethod {
    case cash
    case spos
    case card
    case qr
    
    public var methodCode: String {
        switch self {
        case .cash:
            return "CASH"
        case .spos:
            return "SPOSCARD"
        case .card:
            return "CTT"
        case .qr:
            return "QR"
        }
    }
    
    public var partnerCode: String {
        // FIXME: Update this
        return "VNPAY"
    }
    
    public var bankCode: String {
        // FIXME: Update this
        return "VNPAYQR"
    }

}
