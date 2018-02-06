//
//  PetsViewController.swift
//  FiveInOne
//
//  Created by Admin on 24/01/18.
//  Copyright © 2018 Charan Raj. All rights reserved.
//

import UIKit

class PetsViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var DropDownClick: UIButton!
    private let PetArray: NSArray = ["Beagles", "Bullmastiff", "Great Dane", "Boxer", "Chihuahua", "Golden Retreiver"]
    private var PetTbl: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    @IBAction func CancelBtnTapped(_ sender: Any) {
        performSegue(withIdentifier: "Pets", sender: self)
    }
    
    @IBAction func DropClicked(_ sender: Any) {
        if DropDownClick.isSelected == true {
            PetTbl.isHidden = true
            DropDownClick.isSelected = false
        }else
        {
            DropDownClick.isSelected = false
            PetTbl = UITableView(frame: CGRect(x: 70, y: 280, width: 240, height: 120))
            PetTbl.register(UITableViewCell.self, forCellReuseIdentifier: "PetCell")
            PetTbl.dataSource = self
            PetTbl.delegate = self
            self.view.addSubview(PetTbl)
            PetTbl.isHidden = false
            DropDownClick.isSelected = true
            dismiss(animated: true, completion: nil)
        }
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return PetArray.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "PetCell", for: indexPath as IndexPath)
        cell.textLabel!.text = "\(PetArray[indexPath.row])"
        return cell
    }
}
