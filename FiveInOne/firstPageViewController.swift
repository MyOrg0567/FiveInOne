//
//  firstPageViewController.swift
//  languageDesign
//
//  Created by Admin on 03/01/18.
//  Copyright © 2018 Admin. All rights reserved.
//

import UIKit

class firstPageViewController: UIViewController {

    @IBOutlet weak var loginBtn: UIButton!
    @IBOutlet weak var signupBtn: UIButton!

    @IBAction func BackBtnTap(_ sender: Any) {
        performSegue(withIdentifier: "Home", sender: self)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func viewDidLayoutSubviews() {
        
        loginBtn.layer.masksToBounds = true
        loginBtn.layer.cornerRadius = 10.0
        loginBtn.layer.borderWidth = 1.0
        loginBtn.layer.borderColor = UIColor.white.cgColor
        
        signupBtn.layer.masksToBounds = true
        signupBtn.layer.cornerRadius = 10.0
        signupBtn.layer.borderWidth = 1.0
        signupBtn.layer.borderColor = UIColor.white.cgColor
        self.navigationController?.navigationBar.isHidden = true

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func loginBtnTapped(_ sender: Any) {
        
    }
    
    @IBAction func SignUpBtnTapped(_ sender: Any) {
        
    }
    

}
