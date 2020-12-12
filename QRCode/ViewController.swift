//
//  ViewController.swift
//  QRCode
//
//  Created by Yonatan Tovim on 11/12/2020.
//

import UIKit




class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
            
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let dest = segue.destination as? ScannerViewController {
            dest.delegate = self
        }
    }
  
}



extension ViewController: ScannerViewControllerDelegate {
    func fetchJsonFromQRCode(jsonString: String) {
        decodeJson(from: jsonString)
    }
    
    func decodeJson(from jsonString: String) {
        guard let personData = jsonString.data(using: .utf8) else {return}
        do {
            let person = try JSONDecoder().decode(Person.self, from: personData)
            dismiss(animated: true) {
                Alert.present(title: "There is a person", message: "\(person)", actions: .ok(handler: nil), from: self)
            }
        } catch {
            let e = QRCodeError.decoding
            dismiss(animated: true) {
                Alert.present(title: e.rawValue, message: e.errorMessage, actions: .ok(handler: nil), from: self)
            }
        }
    }
}




