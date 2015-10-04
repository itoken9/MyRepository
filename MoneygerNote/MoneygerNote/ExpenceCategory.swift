//
//  ExpenceCategory.swift
//  MoneygerNote
//
//  Created by Takaaki Yoshioka on 2015/09/13.
//  Copyright © 2015年 JBS. All rights reserved.
//

import Foundation
import RealmSwift

class ExpenceCategory: Object {
    dynamic var categoryId = 0
    dynamic var name = ""
    dynamic var colorCode = ""
    
    override static func primaryKey() -> String? {
        return "categoryId"
    }
}