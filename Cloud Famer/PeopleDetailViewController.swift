//
//  PeopleDetailViewController.swift
//  foodpin new
//
//  Created by Johnny' mac on 2016/2/5.
//  Copyright © 2016年 Johnny' mac. All rights reserved.
//

import UIKit

class PeopleDetailViewController: UIViewController  {
    @IBOutlet var peopleImageView:UIImageView!
    @IBOutlet var peoplenameLable: UILabel!
    @IBOutlet var peoplelocationLable: UILabel!
    @IBOutlet var peopletypeLable: UILabel!

    
    var people:People!
    
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //載入視圖後，的其他動作
      peopleImageView?.image = UIImage(named: people.image)
      peoplenameLable.text = people.name
      peoplelocationLable.text = people.location
      peopletypeLable.text = people.type

        
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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

