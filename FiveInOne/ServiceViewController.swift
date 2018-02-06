//
//  ServiceViewController.swift
//  FiveInOne
//
//  Created by Admin on 25/01/18.
//  Copyright © 2018 Charan Raj. All rights reserved.
//

import UIKit

class ServiceViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    private let HomeArray: NSArray = ["Painter", "Electricians", "Plumber", "Raw Materials", "Others"]
    
    private let VehicleArray: NSArray = ["Bike", "Car", "Others"]
    
    private let TransportArray: NSArray = ["Auto", "Taxi", "Others"]

    private let ElectricArray: NSArray = ["Mobile", "Computer", "Others"]

    private let HealthArray: NSArray = ["Parlour", "Clinics"]
    
    @IBOutlet weak var HomeServiceBtn: UIButton!
    private var HomeTbl: UITableView!
    @IBOutlet weak var VehicleRepairBtn: UIButton!
    private var VehicleTbl: UITableView!
    @IBOutlet weak var TransportServiceBtn: UIButton!
    private var TransportTbl: UITableView!
    @IBOutlet weak var ElectronicServiceBtn: UIButton!
    private var ElectricTbl: UITableView!
    @IBOutlet weak var HealthBtn: UIButton!
    private var HealthTbl: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    @IBAction func BackBtnTapped(_ sender: Any) {
        
        performSegue(withIdentifier: "Services", sender: self)
    }
    @IBAction func HomeBtnTapped(_ sender: Any) {
        
        if HomeServiceBtn.isSelected == true {
            HomeTbl.isHidden = true
            HomeServiceBtn.isSelected = false
        }else
        {
            HomeServiceBtn.isSelected = false
            HomeTbl = UITableView(frame: CGRect(x: 70, y: 150, width: 240, height: 120))
            HomeTbl.register(UITableViewCell.self, forCellReuseIdentifier: "homeCell")
            HomeTbl.dataSource = self
            HomeTbl.delegate = self
            self.view.addSubview(HomeTbl)
            HomeTbl.isHidden = false
            HomeServiceBtn.isSelected = true
            dismiss(animated: true, completion: nil)
        }
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return HomeArray.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "homeCell", for: indexPath as IndexPath)
        cell.textLabel!.text = "\(HomeArray[indexPath.row])"
        return cell
    }
    @IBAction func VehicleBtnTapped(_ sender: Any) {
        
        if VehicleRepairBtn.isSelected == true {
            VehicleTbl.isHidden = true
            VehicleRepairBtn.isSelected = false
        }else
        {
            VehicleRepairBtn.isSelected = false
            VehicleTbl = UITableView(frame: CGRect(x: 70, y: 250, width: 240, height: 120))
            VehicleTbl.register(UITableViewCell.self, forCellReuseIdentifier: "motorCell")
            VehicleTbl.dataSource = self
            VehicleTbl.delegate = self
            self.view.addSubview(VehicleTbl)
            VehicleTbl.isHidden = false
            VehicleRepairBtn.isSelected = true
            dismiss(animated: true, completion: nil)
        }
        func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return VehicleArray.count
        }
        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            let cell = tableView.dequeueReusableCell(withIdentifier: "motorCell", for: indexPath as IndexPath)
            cell.textLabel!.text = "\(VehicleArray[indexPath.row])"
            return cell
        }
    }
    @IBAction func TransportBtnTapped(_ sender: Any) {
        if TransportServiceBtn.isSelected == true {
            TransportTbl.isHidden = true
            TransportServiceBtn.isSelected = false
        }else
        {
            TransportServiceBtn.isSelected = false
            TransportTbl = UITableView(frame: CGRect(x: 70, y: 350, width: 240, height: 120))
            TransportTbl.register(UITableViewCell.self, forCellReuseIdentifier: "transportCell")
            TransportTbl.dataSource = self
            TransportTbl.delegate = self
            self.view.addSubview(TransportTbl)
            TransportTbl.isHidden = false
            TransportServiceBtn.isSelected = true
            dismiss(animated: true, completion: nil)
        }
        func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return TransportArray.count
        }
        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            let cell = tableView.dequeueReusableCell(withIdentifier: "transportCell", for: indexPath as IndexPath)
            cell.textLabel!.text = "\(TransportArray[indexPath.row])"
            return cell
        }
    }
    
    @IBAction func ElectronicBtnTapped(_ sender: Any) {
        if  ElectronicServiceBtn.isSelected == true {
            ElectricTbl.isHidden = true
            ElectronicServiceBtn.isSelected = false
        }else
        {
            ElectronicServiceBtn.isSelected = false
            ElectricTbl = UITableView(frame: CGRect(x: 70, y: 450, width: 240, height: 120))
            ElectricTbl.register(UITableViewCell.self, forCellReuseIdentifier: "electricCell")
            ElectricTbl.dataSource = self
            ElectricTbl.delegate = self
            self.view.addSubview(ElectricTbl)
            ElectricTbl.isHidden = false
            ElectronicServiceBtn.isSelected = true
            dismiss(animated: true, completion: nil)
        }
        func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return ElectricArray.count
        }
        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            let cell = tableView.dequeueReusableCell(withIdentifier: "electricCell", for: indexPath as IndexPath)
            cell.textLabel!.text = "\(ElectricArray[indexPath.row])"
            return cell
        }
    }
    @IBAction func HealthBtnTapped(_ sender: Any) {
        
        if HealthBtn.isSelected == true {
            HealthTbl.isHidden = true
            HealthBtn.isSelected = false
        }else
        {
            HealthBtn.isSelected = false
            HealthTbl = UITableView(frame: CGRect(x: 70, y: 550, width: 240, height: 120))
            HealthTbl.register(UITableViewCell.self, forCellReuseIdentifier: "healthCell")
            HealthTbl.dataSource = self
            HealthTbl.delegate = self
            self.view.addSubview(HealthTbl)
            HealthTbl.isHidden = false
            HealthBtn.isSelected = true
            dismiss(animated: true, completion: nil)
        }
        func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return HealthArray.count
        }
        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            let cell = tableView.dequeueReusableCell(withIdentifier: "healthCell", for: indexPath as IndexPath)
            cell.textLabel!.text = "\(HealthArray[indexPath.row])"
            return cell
        }
    }
}
