//
//  recoverPasswordViewController.swift
//  languageDesign
//
//  Created by Admin on 03/01/18.
//  Copyright © 2018 Admin. All rights reserved.
//

import UIKit

class recoverPasswordViewController: UIViewController {


    @IBAction func sendBtnTapped(_ sender: Any) {
        performSegue(withIdentifier: "Retrieve", sender: self)
        
    }
    
    override func viewDidLayoutSubviews() {
        self.navigationController?.navigationBar.isHidden = true
    }
    
    @IBAction func BackBtn(_ sender: Any) {
        performSegue(withIdentifier: "LoginPage", sender: self)
        
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
