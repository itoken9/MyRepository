//
//  FirstViewController.swift
//  MoneygerNote
//
//  Created by Takaaki Yoshioka on 2015/09/12.
//  Copyright © 2015年 JBS. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate, UIScrollViewDelegate {

    let BETWEEN_WIDTH = CGFloat(5)
    let NUMPAGES = 3
    var barColor = UIColor(red: CGFloat(0.18), green: CGFloat(0.80), blue: CGFloat(0.44), alpha: CGFloat(1.0))
    var pageControl = UIPageControl()
    @IBOutlet weak var scrollView: UIScrollView!
    
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
    
    /* Sectionの数 */
    func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        return 3
    }
    
    /* Cellの数 */
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 6
    }

    /* Sectionに値を設定する */
    func collectionView(collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, atIndexPath indexPath: NSIndexPath) -> UICollectionReusableView {

        let header:CustomHeader = collectionView.dequeueReusableSupplementaryViewOfKind(UICollectionElementKindSectionHeader, withReuseIdentifier: "header", forIndexPath: indexPath) as! CustomHeader
        
        header.calcLabel?.text = "計上"
        header.calcButton?.setTitle("☆", forState: .Normal)
        header.header?.text = "section"
        // header.backgroundColor = UIColor(red: CGFloat(100) / 255.0, green: CGFloat(200) / 255.0, blue: CGFloat(140) / 255.0, alpha: CGFloat(1.0))
        return header
    }
    
    @IBAction func switchToAllGroupEdit(sender: AnyObject) {
        self.performSegueWithIdentifier("AllGroupEdit", sender: self)
    }
}

class CustomHeader : UICollectionReusableView {
    @IBOutlet weak var header:UILabel!
    @IBOutlet weak var calcLabel:UILabel!
    @IBOutlet weak var calcButton:UIButton!
}

class CustomCell : UICollectionViewCell {
    @IBOutlet weak var title:UILabel!
    @IBOutlet weak var image:UIImageView!
    
    override init(frame: CGRect){
        super.init(frame: frame)
    }
    required init(coder aDecoder: NSCoder){
        super.init(coder: aDecoder)!
    }
    
}
