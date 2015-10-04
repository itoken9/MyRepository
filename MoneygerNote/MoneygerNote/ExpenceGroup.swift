//
//  ExpenceGroup.swift
//  MoneygerNote
//
//  Created by Takaaki Yoshioka on 2015/09/13.
//  Copyright © 2015年 JBS. All rights reserved.
//

import Foundation
import RealmSwift

class ExpenceGroup: Object {
    dynamic var groupId = 0
    dynamic var name = ""
    dynamic var position = 0
    dynamic var isCollapse = false
    
    override static func primaryKey() -> String? {
        return "groupId"
    }
}