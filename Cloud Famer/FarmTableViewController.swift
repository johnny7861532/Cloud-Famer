//
//  FarmTableViewController.swift
//  Cloud Famer
//
//  Created by Johnny' mac on 2016/2/23.
//  Copyright © 2016年 Johnny' mac. All rights reserved.
//

import UIKit

class FarmTableViewController: UITableViewController {@IBAction func close(segue: UIStoryboardSegue){
    
    }
    
    var farms:[Farm]=[
        
        Farm(name: "Cafe Deadend", type: "蔬果", location: "台中大里", image: "cafedeadend.jpg", isVisited: false),
        Farm(name: "Homei", type: "晚班", location: "台中西屯", image: "homei.jpg", isVisited: false),
        Farm(name: "Teakha", type: "早班", location: "台中大里", image: "teakha.jpg", isVisited: false),
        Farm(name: "Homei", type:  "正常班", location: "台中西屯", image: "homei.jpg", isVisited: false),
        Farm(name: "Cafe Loisl", type: "計時人員", location: "台中西屯", image: "cafeloisl.jpg", isVisited: false),
        Farm(name: "Petitle Oyster", type: "早班", location: "台中北屯", image: "petiteoyster.jpg", isVisited: false),
        Farm(name: "For Kee Restaurant", type: "計時人員", location: "台中太平", image: "forkeerestaurant.jpg", isVisited: false),
        Farm(name: "Po's Atelier", type: "早班", location: "台中西屯", image: "posatelier.jpg", isVisited: false),
        Farm(name: "Bourke Street Bakery", type: "早班", location: "台中南屯", image: "bourkestreetbakery.jpg", isVisited: false),
        Farm(name: "Haigh's Chocolate", type: "晚班", location: "台中大甲", image: "haighschocolate.jpg", isVisited: false),
        Farm(name: "Palomino Espresso", type:"正常班", location: "台中豐原", image: "palominoespresso.jpg", isVisited: false),
        Farm(name: "Upstate", type: "晚班", location: "台中西屯", image: "upstate.jpg", isVisited: false),
        Farm(name: "Graham Avenue Meats and Deli", type: "晚班", location: "台中大里", image: "grahamavenuemeats.jpg", isVisited: false),
        Farm(name: "Traif", type: "正常班", location: "台中西區", image: "traif.jpg", isVisited: false),
        Farm(name: "Waffle & Wolf", type: "晚班", location: "台中中區", image: "wafflewolf.jpg", isVisited: false),
        Farm(name: "Five Leaves", type: "正常班", location: "台中東區", image: "fiveleaves.jpg", isVisited: false),
        Farm(name: "Cafe Lore", type: "早班", location: "台中西屯", image: "cafelore.jpg", isVisited: false),
        Farm(name: "Confessional", type: "計時人員", location: "台中西屯", image: "confessional.jpg", isVisited: false),
        Farm(name: "Barrafina", type: "晚班", location: "台中太平", image: "barrafina.jpg", isVisited: false),
        Farm(name: "Donostia", type: "晚班", location: "台中市政府", image: "donostia.jpg", isVisited: false),
        Farm(name: "Royal Oak", type: "計時人員", location: "台中一中街", image: "royaloak.jpg", isVisited: false),
        Farm(name: "Thai Cafe", type: "晚班", location: "台中西屯", image: "thaicafe.jpg", isVisited: false),
        
        
    ]
    
    
    
    
    
    //建立搜尋
    var searchController: UISearchController!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        searchController = UISearchController(searchResultsController: nil)
        tableView.tableHeaderView = searchController.searchBar
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false
        
        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - Table view data source
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return farms.count
    }
    
    
    
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cellIdentidfier = "FarmCell"
        
        let cell = tableView.dequeueReusableCellWithIdentifier(cellIdentidfier, forIndexPath: indexPath)as! FarmTableViewCell
        
        cell.nameLable.text = farms[indexPath.row].name
        
        cell.thumbnailImageView.image = UIImage(named: farms[indexPath.row].image)
        
        cell.locationLable.text = farms[indexPath.row].location
        
        cell.typeLable.text = farms[indexPath.row].type
        
        cell.accessoryType = farms[indexPath.row].isVisited ? .Checkmark : .None
        
        
        return cell
        
        
        
    }
    //    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
    //
    //        // Create an option menu as an action sheet
    //        let optionMenu = UIAlertController(title: nil, message: "Call", preferredStyle: .Alert)
    //
    //        // Add Cancel action to the menu
    //        let cancelAction = UIAlertAction(title: "Cancel", style: .Cancel, handler: nil)
    //        optionMenu.addAction(cancelAction)
    //
    //        self.presentViewController(optionMenu, animated: true, completion: nil)
    //
    //        let callActionHandler = {(action:UIAlertAction!)-> Void in
    //            let alertMessage = UIAlertController(title: "Serivce Unavilable", message: "Sorry, the call feature is not available yet. Please retry later.", preferredStyle: .Alert)
    //            alertMessage.addAction(UIAlertAction(title: "OK", style: .Default, handler: nil))
    //            self.presentViewController(alertMessage, animated: true, completion: nil)
    //
    //
    //        }
    //
    //
    //       let callAction = UIAlertAction(title: "Call"+"+886 928-983-584", style: UIAlertActionStyle.Default, handler:callActionHandler)
    //        optionMenu.addAction(callAction)
    //
    //
    //    }
    
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath){
        
        if editingStyle == .Delete{
            //從data source 刪除資料
            farms.removeAtIndex(indexPath.row)
        }
        tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
    }
    
    override func tableView(tableView: UITableView, editActionsForRowAtIndexPath indexPath: NSIndexPath) -> [UITableViewRowAction]? {
        //社群分享
        let shareAction = UITableViewRowAction(style: UITableViewRowActionStyle.Default, title: "Share", handler: {(action,indexPath) -> Void in
            
            let defaultText = "App test post " + self.farms[indexPath.row].name + self.farms[indexPath.row].type + self.farms[indexPath.row].location
            //分享圖片
            if let imageToShare = UIImage(named: self.farms[indexPath.row].image){
                
                let activityController = UIActivityViewController(activityItems: [defaultText, imageToShare], applicationActivities: nil)
                self.presentViewController(activityController, animated: true, completion: nil)
            }
            
            
        })
        
        //刪除按鈕
        let deleteAction = UITableViewRowAction(style: UITableViewRowActionStyle.Default, title: "Delete", handler: {(action, indexPath) -> Void in
            
            //從data source 刪除列
            self.farms.removeAtIndex(indexPath.row)
            self.tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        })
        shareAction.backgroundColor = UIColor(red: 175.0/255.0, green: 238.0/255.0, blue: 238.0/255.0, alpha: 1.0)
        deleteAction.backgroundColor = UIColor(red: 204.0/255.0, green: 204.0/255.0, blue: 255.0/255.0, alpha: 1.0)
        
        return [deleteAction, shareAction]
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "ShowFarmDetail" {
            if let indexPath = tableView.indexPathForSelectedRow{
                let destinationController = segue.destinationViewController as!
                FarmDetailViewController
                destinationController.farm = farms[indexPath.row]
            }
        }
    }
}