//
//  languageViewController.swift
//  languageDesign
//
//  Created by Admin on 03/01/18.
//  Copyright © 2018 Admin. All rights reserved.
//

import UIKit



class languageViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var languageBtn: UIButton!
    private let languageArray: NSArray = ["English","ಕನ್ನಡ","हिन्दी"]
    private var languageTbl: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewDidLayoutSubviews() {
        self.navigationController?.navigationBar.isHidden = true
    }
    
    @IBAction func checkingBtnTapped(_ sender: Any) {
        languageTbl = UITableView(frame: CGRect(x: languageBtn.frame.origin.x, y: languageBtn.frame.origin.y+languageBtn.frame.size.height+1, width: languageBtn.frame.size.width, height: 132))
        languageTbl.register(UITableViewCell.self, forCellReuseIdentifier: "MyCell")
        languageTbl.dataSource = self
        languageTbl.delegate = self
        self.view.addSubview(languageTbl)
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        languageBtn.setTitle(languageArray[indexPath.row] as? String, for: .normal)
        self.confirmLanguage()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return languageArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MyCell", for: indexPath as IndexPath)
        cell.textLabel!.text = "\(languageArray[indexPath.row])"
        return cell
    }
    
    func confirmLanguage() {
        let nextVC = self.storyboard?.instantiateViewController(withIdentifier: "InterestViewController") as! InterestViewController
        self.navigationController?.pushViewController(nextVC, animated: true)
    }
}

