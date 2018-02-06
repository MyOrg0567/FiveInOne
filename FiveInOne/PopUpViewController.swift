//
//  PopUpViewController.swift
//  FiveInOne
//
//  Created by Admin on 19/01/18.
//  Copyright © 2018 Charan Raj. All rights reserved.
//

import UIKit

class PopUpViewController: UIViewController {

   
    
    @IBOutlet weak var BuySellBtn: UIButton!
    @IBOutlet weak var ServicesBtn: UIButton!
    @IBOutlet weak var CropsBtn: UIButton!
    @IBOutlet weak var PetsBtn: UIButton!
    @IBOutlet weak var JobsBtn: UIButton!
    @IBOutlet weak var MedicinesBtn: UIButton!
    @IBAction func CropsBtnTapped(_ sender: Any) {
        
        performSegue(withIdentifier: "CropService", sender: self)
    }
    
    
    @IBAction func PetsBtnTapped(_ sender: Any) {
        
        performSegue(withIdentifier: "PetsService", sender: self)
    }
    
    @IBAction func CancelBtnTapped(_ sender: Any) {
        self.view.removeFromSuperview()
    }
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    override func viewDidLayoutSubviews() {
        
        BuySellBtn.layer.masksToBounds = true
        BuySellBtn.layer.cornerRadius = 23.0
        BuySellBtn.layer.borderWidth = 1.0
        BuySellBtn.layer.borderColor = UIColor.white.cgColor
        
        ServicesBtn.layer.masksToBounds = true
        ServicesBtn.layer.cornerRadius = 23.0
        ServicesBtn.layer.borderWidth = 1.0
        ServicesBtn.layer.borderColor = UIColor.white.cgColor
        
        CropsBtn.layer.masksToBounds = true
        CropsBtn.layer.cornerRadius = 23.0
        CropsBtn.layer.borderWidth = 1.0
        CropsBtn.layer.borderColor = UIColor.white.cgColor
        
        PetsBtn.layer.masksToBounds = true
        PetsBtn.layer.cornerRadius = 23.0
        PetsBtn.layer.borderWidth = 1.0
        PetsBtn.layer.borderColor = UIColor.white.cgColor
        
        JobsBtn.layer.masksToBounds = true
        JobsBtn.layer.cornerRadius = 23.0
        JobsBtn.layer.borderWidth = 1.0
        JobsBtn.layer.borderColor = UIColor.white.cgColor
        
        MedicinesBtn.layer.masksToBounds = true
        MedicinesBtn.layer.cornerRadius = 23.0
        MedicinesBtn.layer.borderWidth = 1.0
        MedicinesBtn.layer.borderColor = UIColor.white.cgColor
    }
    
    
}
