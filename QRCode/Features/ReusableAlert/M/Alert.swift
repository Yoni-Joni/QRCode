//
//  Alert.swift
//  QRCode
//
//  Created by Yonatan Tovim on 12/12/2020.
//

import UIKit

struct Alert {
    static func present(title:String?, message:String, actions:Alert.Action..., from controller:UIViewController){
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        actions.forEach { alertController.addAction($0.alertAction) }
        controller.present(alertController, animated: true, completion: nil)
    }
}

