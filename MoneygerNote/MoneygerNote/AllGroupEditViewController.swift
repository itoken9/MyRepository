//
//  AllGroupEditViewController.swift
//  MoneygerNote
//
//  Created by Takaaki Yoshioka on 2015/09/13.
//  Copyright © 2015年 JBS. All rights reserved.
//

import Foundation
import UIKit

class AllGroupEditViewController: UIViewController {
    private var myImageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        // UIImageViewを作成する.
        myImageView = UIImageView(frame: CGRectMake(0,0,100,110))
        
        // 表示する画像を設定する.
        let myImage = UIImage(named: "appleRainow.jpg")
        
        // 画像をUIImageViewに設定する.
        myImageView.image = myImage
        
        // 画像の表示する座標を指定する.
        myImageView.layer.position = CGPoint(x: self.view.bounds.width/2, y: 200.0)
        
        // UIImageViewをViewに追加する.
        self.view.addSubview(myImageView)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    @IBAction func backTo(sender: AnyObject) {
        self.dismissViewControllerAnimated(true, completion: nil)
    }
}