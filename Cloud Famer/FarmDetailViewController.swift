//
//  FarmDetailViewController.swift
//  Cloud Famer
//
//  Created by Johnny' mac on 2016/2/23.
//  Copyright © 2016年 Johnny' mac. All rights reserved.
//

import UIKit


class FarmDetailViewController: UIViewController {
    @IBOutlet var farmImageView:UIImageView!
    @IBOutlet var farmnameLable: UILabel!
    @IBOutlet var farmlocationLable: UILabel!
    @IBOutlet var farmtypeLable: UILabel!
    
    var farm:Farm!
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //載入視圖後，的其他動作
        
        farmImageView.image = UIImage(named: farm.image)
        farmnameLable.text = farm.name
        farmlocationLable.text = farm.location
        farmtypeLable.text = farm.type
        
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    //如果缺少此部分，則在開啟ＭAP的時候會出現error thread one
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "showMap" {
            let destinationController = segue.destinationViewController as! MapViewController
            destinationController.farm = farm}
    }
    
    
    
    /*
    // MARK: - Navigation
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
    // Get the new view controller using segue.destinationViewController.
    // Pass the selected object to the new view controller.
    }
    */
    


}
