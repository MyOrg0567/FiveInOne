//
//  Interest.swift
//  FiveInOne
//
//  Created by Admin on 18/01/18.
//  Copyright © 2018 Charan Raj. All rights reserved.
//

import UIKit


class Interest
{
    
    var featuredImage: UIImage
    
    
    
    init(featuredImage: UIImage) {
        
        self.featuredImage = featuredImage
        
        
    }
    
    static func fetchInterests() -> [Interest]
    {
        return [
            Interest(featuredImage: UIImage(named: "Service-Offer")!),
            Interest(featuredImage: UIImage(named: "Service-Offer-1")!),
            Interest(featuredImage: UIImage(named: "Service-Offer-2")!)
        ]
    }
}

