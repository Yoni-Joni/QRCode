//
//  Alert.Action+Enum.swift
//  QRCode
//
//  Created by Yonatan Tovim on 12/12/2020.
//

import UIKit


extension Alert {
    
    enum Action {
        case ok(handler: ActionHandler?)
        case retry(handler: ActionHandler?)
        case close
        
        typealias ActionHandler = () -> Void
        
        // Returns the title of our action button
        private var title: String {
            switch self {
            case .ok:
                return "OK"
            case .retry:
                return "Retry"
            case .close:
                return "Close"
            }
        }
        
        // Returns the completion handler of our button
        private var handler: ActionHandler? {
            switch self {
            case .ok(let handler):
                return handler
            case .retry(let handler):
                return handler
            case .close:
                return nil
            }
        }
        
        var alertAction: UIAlertAction {
            return UIAlertAction(title: title, style: .default, handler: { _ in
                if let handler = self.handler {
                    handler()
                }
            })
        }
    }    
}
