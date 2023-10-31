//
//  Alert.swift
//  ProjetoAppBatelMovie
//
//  Created by Ricardo Massaki on 30/10/23.
//

import UIKit

class Alert {
    
    let controller: UIViewController
    init(controller: UIViewController) {
        self.controller = controller
    }
    
    //    func configAlert(title: String, message: String) {
    func configAlert(title: String, message: String, secondButton: Bool, completion: (() -> Void)? = nil) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        
        let ok = UIAlertAction(title: "Ok", style: .default)
        let cancel = UIAlertAction(title: "Cancel", style: .cancel) { action in
            self.controller.dismiss(animated: true)
        }
        if secondButton {
            alertController.addAction(cancel)
        }
        alertController.addAction(ok)
        self.controller.present(alertController, animated: true, completion: nil)
        
    }

}
