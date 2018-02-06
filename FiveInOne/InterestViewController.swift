//
//  InterestViewController.swift
//  FiveInOne
//
//  Created by Admin on 18/01/18.
//  Copyright © 2018 Charan Raj. All rights reserved.
//

import UIKit

class InterestViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, UITabBarDelegate {
    
    @IBOutlet weak var tabBarItemSelected: UITabBarItem!
    private let tabArray: NSArray = ["Home","New Post","Register"]
    private var ServeArray: NSArray = ["eCommerce", "Services", "Crops", "Pets", "Jobs", "Medicines", "Language Change", "Logout"]
    @IBOutlet weak var tabBarSelected: UITabBar!
    @IBAction func AvailableServicesBtnClicked(_ sender: Any) {
        let PopUc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "PopUp") as! PopUpViewController
        self.addChildViewController(PopUc)
        PopUc.view.frame = self.view.frame
        self.view.addSubview(PopUc.view)
    }
    @IBOutlet weak var displayBtn: UIButton!
    private var menuTable: UITableView!
    @IBOutlet weak var ScrollImage: UIScrollView!
    @IBOutlet weak var interestedView: UIView!
    @IBOutlet weak var collectionView: UICollectionView!
    @IBAction func menuClicked(_ sender: Any) {
        if displayBtn.isSelected == true {
            menuTable.isHidden = true
            displayBtn.isSelected = false
        }else
        {
            displayBtn.isSelected = false
            menuTable = UITableView(frame: CGRect(x: 0, y: 147, width: 240, height: 520))
            menuTable.register(UITableViewCell.self, forCellReuseIdentifier: "menuCell")
            menuTable.dataSource = self
            menuTable.delegate = self
            self.view.addSubview(menuTable)
            menuTable.isHidden = false
            displayBtn.isSelected = true
            dismiss(animated: true, completion: nil)
        }
    }
    var interests = Interest.fetchInterests()
    let cellScaling: CGFloat = 0.6
    override func viewDidLoad() {
        super.viewDidLoad()
        tabBarSelected.delegate = self
        collectionView.dataSource = self
        collectionView.delegate = self
    }
}
extension InterestViewController : UIScrollViewDelegate, UICollectionViewDelegate
{
    func scrollViewWillEndDragging(_ scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {
        let layout = self.collectionView?.collectionViewLayout as! UICollectionViewFlowLayout
        let cellWidthIncludingSpacing = layout.itemSize.width + layout.minimumLineSpacing
        var offset = targetContentOffset.pointee
        let index = (offset.x + scrollView.contentInset.left) / cellWidthIncludingSpacing
        let roundIndex = round(index)
        offset = CGPoint(x: roundIndex * cellWidthIncludingSpacing - scrollView.contentInset.left, y: -scrollView.contentInset.top)
        targetContentOffset.pointee = offset
    }
}
extension InterestViewController : UICollectionViewDataSource
{
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return interests.count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "InterestCell", for: indexPath) as! InterestCollectionViewCell
        
        cell.interest = interests[indexPath.item]
        return cell
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return ServeArray.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "menuCell",  for: indexPath as IndexPath) 
        cell.textLabel!.text = "\(ServeArray[indexPath.row])"
        return cell
    }
    func confirmPush(){
        let nextVC = self.storyboard?.instantiateViewController(withIdentifier: "firstPageViewController") as! firstPageViewController
        self.navigationController?.pushViewController(nextVC, animated: true)
    }
    func tabBar(_ tabBar: UITabBar, didSelect item: UITabBarItem) {
        
        if tabBarSelected.selectedItem == tabBarItemSelected {
            self.confirmPush()
        }
    }
    
}

