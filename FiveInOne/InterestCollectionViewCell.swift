//
//  InterestCollectionViewCell.swift
//  FiveInOne
//
//  Created by Admin on 18/01/18.
//  Copyright © 2018 Charan Raj. All rights reserved.
//

import UIKit

class InterestCollectionViewCell: UICollectionViewCell {
    
    
    
    @IBOutlet weak var featuredImageView: UIImageView!
    var interest: Interest? {
        
        didSet {
            self.updateUI()
        }
    }
    
    private func updateUI()
    {
        if let interest = interest {
            featuredImageView.image = interest.featuredImage
            
        }
        else {
            featuredImageView.image = nil
        }
    }
    
    override func layoutSubviews()
    {
        super.layoutSubviews()
        self.layer.cornerRadius = 3.0
        layer.shadowRadius = 2
        layer.shadowOpacity = 0.0
        layer.shadowOffset = CGSize(width: 5, height: 10)
        self.clipsToBounds = false
    }
}
