//
//  SampleDataMaker.swift
//  MoneygerNote
//
//  Created by Takaaki Yoshioka on 2015/09/13.
//  Copyright © 2015年 JBS. All rights reserved.
//

import Foundation
import RealmSwift

class SampleDataMeker {
    init() {
        let config = Realm.Configuration(
            schemaVersion: 3,
            migrationBlock: { migration, oldSchemaVersion in
                if (oldSchemaVersion < 3) {
                }
            }
        )
        
        Realm.Configuration.defaultConfiguration = config
        
        let realm = try! Realm()
        
        try! realm.write {
            realm.deleteAll()
            
            // グループ
            let expenceGroups = self.makeExpenceGroup()
            for item in expenceGroups {
                realm.create(ExpenceGroup.self, value: item)
            }
            let groupResults = realm.objects(ExpenceGroup)
            
            // カテゴリー
            let expenceCategorys = self.makeExpenceCategory()
            for item in expenceCategorys {
                realm.create(ExpenceCategory.self, value: item)
            }
            let categoryResults = realm.objects(ExpenceCategory)
            
            // アイテム
            let expenceItems = self.makeExpenceItems(groupResults, categoryResults: categoryResults)
            for item in expenceItems {
                realm.create(ExpenceItem.self, value: item)
            }
            print(realm.objects(ExpenceItem))
        }
    }
    
    private func makeExpenceGroup() -> [ExpenceGroup] {
        let seeds = [
            ["groupId": 1, "name": "日常", "position": 0, "isCollapse": false],
            ["groupId": 2, "name": "飯", "position": 0, "isCollapse": false]
        ]
        
        var dst = [ExpenceGroup]()
        
        for seed: Dictionary in seeds {
            let item = ExpenceGroup();
            item.groupId = seed["groupId"] as! Int
            item.name = seed["name"] as! String
            item.position = seed["position"] as! Int
            item.isCollapse = seed["isCollapse"] as! Bool
            dst.append(item)
        }
        
        return dst
    }
    
    private func makeExpenceCategory() -> [ExpenceCategory] {
        let seeds = [
            ["categoryId": 1, "name": "食事", "colorCode": "#569C77"],
            ["categoryId": 2, "name": "嗜好品", "colorCode": "#ECA98D"]
        ]
        
        var dst = [ExpenceCategory]()
        
        for seed: Dictionary in seeds {
            let item = ExpenceCategory();
            item.categoryId = seed["categoryId"] as! Int
            item.name = seed["name"] as! String
            item.colorCode = seed["colorCode"] as! String
            dst.append(item)
        }
        
        return dst
    }
    
    private func makeExpenceItems(groupResults: Results<ExpenceGroup>, categoryResults: Results<ExpenceCategory>) -> [ExpenceItem] {
        let seeds = [
            ["itemId": 1, "group": groupResults[0], "name": "コーヒー", "position": 1, "category": categoryResults[1], "ammount": 300, "imageInfo": "", "expenceDate": NSDate()],
            ["itemId": 2, "group": groupResults[0], "name": "タバコ", "position": 2, "category": categoryResults[1], "ammount": 450, "imageInfo": "", "expenceDate": NSDate()],
            ["itemId": 3, "group": groupResults[1], "name": "昼食", "position": 3, "category": categoryResults[0], "ammount": 300, "imageInfo": "", "expenceDate": NSDate()],
            ["itemId": 4, "group": groupResults[1], "name": "夕食", "position": 1, "category": categoryResults[0], "ammount": 300, "imageInfo": "", "expenceDate": NSDate()]
        ]
        var dst = [ExpenceItem]()
        
        for seed: Dictionary in seeds {
            let item = ExpenceItem();
            item.itemId = seed["itemId"] as! Int
            item.group = seed["group"] as? ExpenceGroup
            item.name = seed["name"] as! String
            item.position = seed["position"] as! Int
            item.category = seed["category"] as? ExpenceCategory
            item.ammount = seed["ammount"] as! Int
            item.imageInfo = seed["imageInfo"] as! String
            item.expenceDate = seed["expenceDate"] as! NSDate
            dst.append(item)
        }
        
        return dst
    }
}
