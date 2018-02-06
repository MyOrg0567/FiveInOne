//
//  loginViewController.swift
//  languageDesign
//
//  Created by Admin on 03/01/18.
//  Copyright © 2018 Admin. All rights reserved.
//

import UIKit

class loginViewController: UIViewController, UITextFieldDelegate {
    
    
    @IBOutlet weak var usernameTF: UITextField!
    @IBOutlet weak var passwordTF: UITextField!
    
    let servicemodel = ServiceModel()
    
    
    @IBAction func ForgotPasswordBtnTapped(_ sender: Any) {
        performSegue(withIdentifier: "Mobile", sender: self)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        usernameTF.delegate = self
        passwordTF.delegate = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
    }
    
    override func viewDidLayoutSubviews() {
        self.navigationController?.navigationBar.isHidden = true
        
    }
    
    
    @IBAction func onClickLogin(_ sender: Any) {
        
        if (usernameTF.text == "" || passwordTF.text == ""){
            let alertController = UIAlertController(title: "Mandatory", message: "Please enter Username and Password", preferredStyle: .alert)
            
            let defaultAction = UIAlertAction(title: "OK", style: .default, handler: nil)
            alertController.addAction(defaultAction)
            
            present(alertController, animated: true, completion: nil)
        }
        else {
            FIOProgressView.shared.showProgressView(self.view)
            servicemodel.login(username:usernameTF.text!,
                               password: passwordTF.text!, completion: { response in
                                
                                let msg = response["msg"] as? String
                                if (msg != "success"){
                                    print(response)
                                    DispatchQueue.main.async {
                                        FIOProgressView.shared.hideProgressView()
                                    }
                                }
                                else {
                                    DispatchQueue.main.async {
                                        FIOProgressView.shared.hideProgressView()
                                        let alertController = UIAlertController(title: "Error", message: "Please enter valid credentials", preferredStyle: .alert)
                                        let defaultAction = UIAlertAction(title: "OK", style: .default, handler: nil)
                                        alertController.addAction(defaultAction)
                                        self.present(alertController, animated: true, completion: nil)
                                    }
                                }
            })
        }
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.view.endEditing(true)
        return false
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
    
}
