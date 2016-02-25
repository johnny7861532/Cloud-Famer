//
//  PeopleTableViewController.swift
//  foodpin new
//
//  Created by Johnny' mac on 2016/2/5.
//  Copyright © 2016年 Johnny' mac. All rights reserved.
//

import UIKit


class PeopleTableViewController: UITableViewController {
    var people:[People]=[
        
        People(name: "蔡沛哲", type: "生態學", location: "台中西屯", image: "maleuser1.jpg"),
        People(name: "謝嘉駿", type: "微生物", location: "台中大里", image: "maleuser2.jpg")
        
        
        
        
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
        return people.count
    }
    
    
    
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cellIdentidfier = "PeopleCell"
        
        let cell = tableView.dequeueReusableCellWithIdentifier(cellIdentidfier, forIndexPath: indexPath)as! PeopleTableViewCell
        
        cell.nameLable.text = people[indexPath.row].name
        
        cell.thumbnailImageView.image = UIImage(named: people[indexPath.row].image)
        
        cell.locationLable.text = people[indexPath.row].location
        
        cell.typeLable.text = people[indexPath.row].type
        
        
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
            people.removeAtIndex(indexPath.row)
        }
        tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
    }
    
    override func tableView(tableView: UITableView, editActionsForRowAtIndexPath indexPath: NSIndexPath) -> [UITableViewRowAction]? {
        //社群分享
        let shareAction = UITableViewRowAction(style: UITableViewRowActionStyle.Default, title: "Share", handler: {(action,indexPath) -> Void in
            
            let defaultText = "App test post " + self.people[indexPath.row].name + self.people[indexPath.row].type + self.people[indexPath.row].location
            //分享圖片
            if let imageToShare = UIImage(named: self.people[indexPath.row].image){
                
                let activityController = UIActivityViewController(activityItems: [defaultText, imageToShare], applicationActivities: nil)
                self.presentViewController(activityController, animated: true, completion: nil)
            }
            
            
        })
        
        //刪除按鈕
        let deleteAction = UITableViewRowAction(style: UITableViewRowActionStyle.Default, title: "Delete", handler: {(action, indexPath) -> Void in
            
            //從data source 刪除列
            self.people.removeAtIndex(indexPath.row)
            self.tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        })
        shareAction.backgroundColor = UIColor(red: 175.0/255.0, green: 238.0/255.0, blue: 238.0/255.0, alpha: 1.0)
        deleteAction.backgroundColor = UIColor(red: 204.0/255.0, green: 204.0/255.0, blue: 255.0/255.0, alpha: 1.0)
        
        return [deleteAction, shareAction]
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "showPeopleDetail" {
            if let indexPath = tableView.indexPathForSelectedRow{
                let destinationController = segue.destinationViewController as!
                PeopleDetailViewController
                destinationController.people = people[indexPath.row]
            }
        }
    }
}


