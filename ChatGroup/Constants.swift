//
//  Constants.swift
//  ChatGroup
//
//  Created by Igor Pinheiro Ribeiro on 19/01/25.
//

import Foundation


struct K {
    static let appName = "ChatGroup"
    static let cellIdentifier = "ReusableCell"
    static let cellNibName = "MessageCell"
    static let registerSegue = "RegisterToHome"
    static let loginSegue = "LoginToHome"
    static let homeSegue = "HomeToChat"
    
    struct BrandColors {
        static let purple = "BrandPurple"
        static let lightPurple = "BrandLightPurple"
        static let blue = "BrandBlue"
        static let lighBlue = "BrandLightBlue"
    }
    
    struct FStore {
        static let collectionName = "messages"
        static let senderField = "sender"
        static let bodyField = "body"
        static let dateField = "date"
    }
}
