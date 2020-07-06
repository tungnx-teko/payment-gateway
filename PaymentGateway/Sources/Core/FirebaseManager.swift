//
//  FirebaseManager.swift
//  Pods
//
//  Created by Tung Nguyen on 7/3/20.
//

import Foundation
import FirebaseFirestore
import FirebaseFirestoreSwift
import FirebaseCore

class DatabaseManager {
    
    struct Constants {
        static let appName = "payment-gateway"
        static let transactionCollectionPath = "transactions"
        static let paymentCollectionPath = "payment"
    }
    
    static let shared = DatabaseManager()
    
    var database: Firestore?
    
    var transactions: CollectionReference? {
        return database?
            .collection(DatabaseManager.Constants.paymentCollectionPath)
            .document(PaymentGateway.shared.config.clientCode)
            .collection(DatabaseManager.Constants.transactionCollectionPath)
    }
    
    private init() {
        self.setupFirebase()
        
        guard let app = FirebaseApp.app(name: DatabaseManager.Constants.appName) else {
            return
        }
        database = Firestore.firestore(app: app)
    }
    
    private func setupFirebase() {
        // FIXME: Dynamic these values
        let options = FirebaseOptions.init(googleAppID: "1:621256043987:ios:b359f0c782414f1d3f1326",
                                           gcmSenderID: "621256043987")
        
        options.projectID = "payment-test-fc407"
        options.apiKey = "AIzaSyCTMCbvnSPuNG0jk7wW1SRg7gsmYsHbXT0"
        options.databaseURL = "https://payment-test-fc407.firebaseio.com/"
        options.storageBucket = "payment-test-fc407.appspot.com"
        
        FirebaseApp.configure(name: DatabaseManager.Constants.appName, options: options)
    }
    
    
}
