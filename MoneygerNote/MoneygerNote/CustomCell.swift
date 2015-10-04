//
//  CustomCell.swift
//  MoneygerNote
//
//  Created by itoken on 2015/10/04.
//  Copyright © 2015年 JBS. All rights reserved.
//

import UIKit

class CustomCell: UICollectionViewCell {
    @IBOutlet var title:UILabel!
    @IBOutlet var image:UIImageView!
    
    override init(frame: CGRect){
        super.init(frame: frame)
    }
    required init(coder aDecoder: NSCoder){
        super.init(coder: aDecoder)!
    }
    
}