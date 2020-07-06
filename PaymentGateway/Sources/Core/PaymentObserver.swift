//
//  PaymentObserver.swift
//  Pods
//
//  Created by Tung Nguyen on 7/1/20.
//
import FirebaseFirestore
import FirebaseFirestoreSwift
import FirebaseCore

public class PaymentObserver {
    
    let databaseManager = DatabaseManager.shared
    
    public init() {}
    
    public func observe(transactionCode: String, completion: @escaping (Result<PaymentTransactionResult, PaymentError>) -> ()) {
        databaseManager
            .transactions?
            .document(transactionCode)
            .addSnapshotListener { snapshot, error in
                if let dictionary = snapshot?.data() {
                    let result = PaymentTransactionResult(fromDict: dictionary)
                    if result.isSuccess {
                        completion(.success(result))
                    } else {
                        completion(.failure(result.error))
                    }
                }
            }
    }
    
}

public struct PaymentTransactionResult {
    
    public var amount: Double?
    public var message: String?
    public var ref: String?
    public var status: String?
    public var transactionId: String?
    
    public var isSuccess: Bool {
        return status == "000"
    }
    
    public init(fromDict dict: [String: Any]) {
        self.amount = dict["amount"] as? Double
        self.message = dict["message"] as? String
        self.ref = dict["ref"] as? String
        self.status = dict["status"] as? String
        self.transactionId = dict["transaction_id"] as? String
    }
    
    var error: PaymentError {
        guard !isSuccess, let status = self.status, let errorCode = Int(status) else { return .common }
        return PaymentError(code: errorCode)
    }
    
}

public enum PaymentError: Int {
    case common
    case processing
    case paymentProcessed
    case balanceNotEnough
    case paymentCancelled
    case paymentMethodNotSupported
    case outOfStock
    
    public init(code: Int) {
        switch code {
        case 999, 887...895, 882...885, 880, 878, 900...901, 780...782, 699, 501, 499:
            self = .common
        case 886:
            self = .processing
        case 881:
            self = .paymentProcessed
        case 879:
            self = .balanceNotEnough
        case 877:
            self = .paymentCancelled
        case 778...779:
            self = .paymentMethodNotSupported
        case 783:
            self = .outOfStock
        default:
            self = .common
        }
    }
    

    public var message: String {
        switch self {
        case .common:
            return "payment_error_message_common".localized()
        case .processing:
            return "payment_error_message_processing".localized()
        case .paymentProcessed:
            return "payment_error_message_payment_processed".localized()
        case .balanceNotEnough:
            return "payment_error_message_balance_not_enough".localized()
        case .paymentCancelled:
            return "payment_error_message_payment_cancelled".localized()
        case .paymentMethodNotSupported:
            return "payment_error_message_payment_method_not_supported".localized()
        case .outOfStock:
            return "payment_error_message_out_of_stock".localized()
        }
    }
    
}

extension String {
    
    func localized() -> String {
        return self
    }
    
}
