//
//  signUpViewController.swift
//  languageDesign
//
//  Created by Admin on 03/01/18.
//  Copyright © 2018 Admin. All rights reserved.
//

import UIKit

class signUpViewController: UIViewController, UITextFieldDelegate {
    
    let servicemodel = ServiceModel()
    
    @IBOutlet weak var NameTF: UITextField!
    @IBOutlet weak var EmailTF: UITextField!
    @IBOutlet weak var MobileNoTF: UITextField!
    @IBOutlet weak var PasswordTF: UITextField!
    @IBOutlet weak var AadhaarTF: UITextField!
    @IBOutlet weak var AddressTF: UITextField!
    @IBOutlet weak var PinCodeTF: UITextField!
    
    var enteredOTP: String? = ""
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        NameTF.delegate = self
        EmailTF.delegate = self
        MobileNoTF.delegate = self
        PasswordTF.delegate = self
        AadhaarTF.delegate = self
        AddressTF.delegate = self
        PinCodeTF.delegate = self

    }
    
    @IBAction func registerBtnTapped(_ sender: Any) {
        
        if (NameTF.text == "" || EmailTF.text == "" || MobileNoTF.text == "" || PasswordTF.text == "" || AadhaarTF.text == "" || AddressTF.text == "" || PinCodeTF.text == "") {
            let alertController = UIAlertController(title: "Mandatory", message: "Please check wether all the fields filled ??", preferredStyle: .alert)
            
            let defaultAction = UIAlertAction(title: "OK", style: .default, handler: nil)
            alertController.addAction(defaultAction)
            
            present(alertController, animated: true, completion: nil)
        }
        else {
            FIOProgressView.shared.showProgressView(self.view)
            servicemodel.mobileVerify(phone: MobileNoTF.text!, completion: {response in
                print(response)
                //["regid": <null>, "otp": 796592, "msg": otp sent]
                let msg = response["msg"] as? String
                if (msg == "otp sent") {
                    DispatchQueue.main.async {
                        FIOProgressView.shared.hideProgressView()
                        self.OTPScreen()
                        let otp = response["otp"] as? String
                        UserDefaults.standard.setValue(otp, forKey: "otp")
                    }
                }
            })
        }
 
    }
    
    func OTPScreen() {
        
        let DynamicView = UIView(frame: CGRect(x: 40, y: 200, width: 300, height: 250))
        DynamicView.backgroundColor=UIColor.white
        self.view.addSubview(DynamicView)
        self.view.backgroundColor = UIColor.white.withAlphaComponent(0.8)
        
        let label = UILabel(frame: CGRect(x: 50, y: 150, width: 260, height: 150))
        label.center = CGPoint(x: 190, y: 250)
        label.textAlignment = .left
        label.text = "We have sent you an OTP number to your registered mobile. Please enter the OTP"
        label.textColor = UIColor.gray.withAlphaComponent(0.8)
        label.lineBreakMode = .byWordWrapping
        label.numberOfLines = 0
        self.view.addSubview(label)
        
        let myTextField1: UITextField = UITextField(frame: CGRect(x: 70, y: 320, width: 20, height: 20));
        myTextField1.delegate = self
        myTextField1.borderStyle = UITextBorderStyle.line
        myTextField1.backgroundColor = UIColor.white.withAlphaComponent(1.0)
        myTextField1.textColor = UIColor.blue
        self.view.addSubview(myTextField1)
        
        let myTextField2: UITextField = UITextField(frame: CGRect(x: 110, y: 320, width: 20, height: 20));
        myTextField2.borderStyle = UITextBorderStyle.none
        myTextField2.delegate = self
        myTextField2.backgroundColor = UIColor.white.withAlphaComponent(0.5)
        myTextField2.textColor = UIColor.blue
        self.view.addSubview(myTextField2)
        
        let myTextField3: UITextField = UITextField(frame: CGRect(x: 150, y: 320, width: 20, height: 20));
        myTextField3.borderStyle = UITextBorderStyle.none
        myTextField3.delegate = self
        myTextField3.backgroundColor = UIColor.white.withAlphaComponent(0.5)
        myTextField3.textColor = UIColor.blue
        self.view.addSubview(myTextField3)
        
        let myTextField4: UITextField = UITextField(frame: CGRect(x: 190, y: 320, width: 20, height: 20));
        myTextField4.borderStyle = UITextBorderStyle.none
        myTextField4.delegate = self
        myTextField4.backgroundColor = UIColor.white.withAlphaComponent(0.5)
        myTextField4.textColor = UIColor.blue
        self.view.addSubview(myTextField4)
        
        let myTextField5: UITextField = UITextField(frame: CGRect(x: 230, y: 320, width: 20, height: 20));
        myTextField5.borderStyle = UITextBorderStyle.none
        myTextField5.delegate = self
        myTextField5.backgroundColor = UIColor.white.withAlphaComponent(0.5)
        myTextField5.textColor = UIColor.blue
        self.view.addSubview(myTextField5)
        
        let myTextField6: UITextField = UITextField(frame: CGRect(x: 270, y: 320, width: 20, height: 20));
        myTextField6.borderStyle = UITextBorderStyle.none
        myTextField6.delegate = self
        myTextField6.backgroundColor = UIColor.white.withAlphaComponent(0.5)
        myTextField6.textColor = UIColor.blue
        self.view.addSubview(myTextField6)
        
        let button = UIButton(frame: CGRect(x: 70, y: 420, width: 180, height: 27))
        button.backgroundColor = UIColor.blue
        button.center = CGPoint(x: 190, y: 410)
        button.setTitle("Verify", for: .normal)
        button.addTarget(self, action: Selector(("buttonAction")), for: UIControlEvents.touchUpInside)
        self.view.addSubview(button)
        
        
    }
    
    
    @objc func verifyOTP() {
        
        let otp = UserDefaults.standard.value(forKey: "otp") as! String
    
        if (enteredOTP == otp)  {
            servicemodel.signup(username: NameTF.text!, email: EmailTF.text!, mobile: MobileNoTF.text!, password: PasswordTF.text!, aadhar: AadhaarTF.text!, address: AddressTF.text!, pincode:    PinCodeTF.text!, completion: {response in
                let msg = response["msg"] as? String
                if (msg == "otp") {
                    let valid = response["otp"] as? String
                    if (valid == msg ) {
                        print(response)
                    }
                    let alertController = UIAlertController(title: "SUCCESS", message: "YOU ARE SUCCESSFULLY LOGGED IN !!!!", preferredStyle: .alert)
                    let defaultAction = UIAlertAction(title: "OK", style: .default, handler: nil)
                    alertController.addAction(defaultAction)
                    self.present(alertController, animated: true, completion: nil)
                }
                else {
                    print(response)
                }
            })
        }
        
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.view.endEditing(true)
        return false
    }
    
    @objc func textFieldDidChange(_ textField: UITextField) {
        enteredOTP = enteredOTP! + textField.text!
        print(enteredOTP!)
    }
}


