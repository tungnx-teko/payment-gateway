//
//  ApiResult.swift
//  PaymentSDK
//
//  Created by Tung Nguyen on 5/22/20.
//

import Foundation

class ApiResult<T: Decodable>: Decodable {
    var code: Int
    var success: Bool
    var message: String
    var data: T?
}
