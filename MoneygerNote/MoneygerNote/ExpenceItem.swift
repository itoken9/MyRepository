//
//  ExpenceItem.swift
//  MoneygerNote
//
//  Created by Takaaki Yoshioka on 2015/09/13.
//  Copyright © 2015年 JBS. All rights reserved.
//

import Foundation
import RealmSwift

class ExpenceItem: Object {
    dynamic var itemId = 0
    dynamic var group: ExpenceGroup?
    dynamic var name = ""
    dynamic var position = 0
    dynamic var category: ExpenceCategory?
    dynamic var ammount = 0
    dynamic var imageInfo = ""
    dynamic var expenceDate = NSDate()
    
    override static func primaryKey() -> String? {
        return "itemId"
    }
}
