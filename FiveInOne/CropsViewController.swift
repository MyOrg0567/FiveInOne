//
//  CropsViewController.swift
//  FiveInOne
//
//  Created by Admin on 23/01/18.
//  Copyright © 2018 Charan Raj. All rights reserved.
//

import UIKit

class CropsViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    
    @IBOutlet weak var dropDownBtnTapped: UIButton!
    private let VegArray: NSArray = ["Beatroot", "Cabbage", "Capsicum", "Carrot"]
    private var VegTbl: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    @IBAction func CancelTap(_ sender: Any) {
       performSegue(withIdentifier: "Pops", sender: self)
    }
    
    @IBAction func dropBtnClicked(_ sender: Any) {
        if dropDownBtnTapped.isSelected == true {
            VegTbl.isHidden = true
            dropDownBtnTapped.isSelected = false
        }else
        {
            dropDownBtnTapped.isSelected = false
            VegTbl = UITableView(frame: CGRect(x: 70, y: 400, width: 240, height: 120))
            VegTbl.register(UITableViewCell.self, forCellReuseIdentifier: "cropsCell")
            VegTbl.dataSource = self
            VegTbl.delegate = self
            self.view.addSubview(VegTbl)
            VegTbl.isHidden = false
            dropDownBtnTapped.isSelected = true
            dismiss(animated: true, completion: nil)
        }
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return VegArray.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cropsCell", for: indexPath as IndexPath)
        cell.textLabel!.text = "\(VegArray[indexPath.row])"
        return cell
    }
}

