//
//  FirstViewController.swift
//  MoneygerNote
//
//  Created by Takaaki Yoshioka on 2015/09/12.
//  Copyright © 2015年 JBS. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        // DBの初期化をする場合はこのコメントアウトを外す
        // try! SampleDataMeker()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell:CustomCell = collectionView.dequeueReusableCellWithReuseIdentifier("cell", forIndexPath: indexPath) as! CustomCell
        cell.image?.image = UIImage(named: "appleRainow.jpg")
        cell.title?.text = "sample"
        cell.backgroundColor = UIColor.whiteColor()
        collectionView.backgroundColor = UIColor.whiteColor()
        print(indexPath.row)
        return cell
    }
    
    func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        return 3
    }
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 20
    }

    @IBAction func switchToAllGroupEdit(sender: AnyObject) {
        self.performSegueWithIdentifier("AllGroupEdit", sender: self)
    }
}

