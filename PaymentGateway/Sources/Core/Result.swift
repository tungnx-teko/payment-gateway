//
//  Result.swift
//  Pods
//
//  Created by Tung Nguyen on 7/1/20.
//

import Foundation

public enum Result<T, V> {
    case success(T)
    case failure(V)
}
