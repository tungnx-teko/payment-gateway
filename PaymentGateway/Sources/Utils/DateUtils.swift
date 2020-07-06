//
//  DateUtils.swift
//  Teko
//
//  Created by Tung Nguyen on 5/20/20.
//

import Foundation

class DateUtils {
    
    enum DateFormat: String {
        case yyyyMMddHHmmss
    }
    
    static let dateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = DateFormat.yyyyMMddHHmmss.rawValue
        return formatter
    }()
    
    static func toString(date: Date) ->  String {
        return dateFormatter.string(from: date)
    }
    
}
