//
//  ViewController.swift
//  openWeatherMap
//
//  Created by Rodion Molchanov on 02.04.2021.
//

import UIKit

class ViewController: UIViewController {

    
    
    @IBOutlet weak var passwordInput: UITextField!
    @IBOutlet weak var loginInput: UITextField!
    @IBOutlet weak var loginScrollView: UIScrollView!
   
    
    
    
    
    let fromLoginToTableSegue = "fromLoginToTabBar"
    
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        NotificationCenter.default.addObserver(self, selector: #selector(self.keyboardWasShown), name: UIResponder.keyboardWillShowNotification, object: nil)
        
        NotificationCenter.default.addObserver(self, selector: #selector(self.keyboardWillBeHidden), name: UIResponder.keyboardWillHideNotification, object: nil)
       // self.buttonWidthConstraint.constant.isEqual(to: 200.0)
        
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        }
        
        


    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillHideNotification, object: nil)
    }
         
    
@objc func keyboardWasShown(notification: Notification) {
    let info = notification.userInfo! as NSDictionary
    let kbSize = (info.value(forKey: UIResponder.keyboardFrameEndUserInfoKey) as! NSValue).cgRectValue.size
    let contentInsets = UIEdgeInsets(top: 0.0, left: 0.0, bottom: kbSize.height, right: 0.0)
    
    self.loginScrollView?.contentInset = contentInsets
    loginScrollView?.scrollIndicatorInsets = contentInsets
}
    
    
    
    @objc func keyboardWillBeHidden(notification: Notification) {
        let contentInsets = UIEdgeInsets.zero
        loginScrollView?.contentInset = contentInsets
    }
    

    func showAlert(alertText: String) {
        let alertController = UIAlertController(title: "Error", message: alertText, preferredStyle: .alert)
        let okButton = UIAlertAction(title: "Ok", style: .cancel, handler: nil)
        alertController.addAction(okButton)
        present(alertController, animated: true, completion: nil)
    }
    
    
    
    @IBAction func pressLoginButton(_ sender: Any) {
        //        guard let login = self.loginInput.text,
        //              let password = self.passwordInput.text,
        //              login == "admin",
        //              password == "123456"
        //        else {
        //            showAlert(alertText: "Wrong login or password")
        //            return
        //        }
             
                performSegue(withIdentifier: self.fromLoginToTableSegue, sender: self)
    }




}

