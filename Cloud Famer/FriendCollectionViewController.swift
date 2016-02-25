//
//  FriendCollectionViewController.swift
//  foodpin new
//
//  Created by Johnny' mac on 2016/2/19.
//  Copyright © 2016年 Johnny' mac. All rights reserved.
//

import UIKit


class FriendCollectionViewController: UICollectionViewController {
    
    var friend:[Friend]=[
        
        Friend(name: "蔡沛哲", type: "生態學", location: "台中西屯", image: "maleuser1.jpg"),
        Friend(name: "謝嘉駿", type: "微生物", location: "台中大里", image: "maleuser2.jpg"),
        Friend(name:"鄭勝凱", type: "機械", location:"雲林西螺", image: "male3.jpg")
        
        
        
        
    ]
    
    override func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        return 1
    }
    
    override func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return friend.count
    }
    
    override func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cellIdentidfier = "FriendCell"
        
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier(cellIdentidfier, forIndexPath: indexPath) as!FriendCollectionViewCell
        
        cell.nameLabel.text = friend[indexPath.row].name
        
        cell.friendImageView.image = UIImage(named: friend[indexPath.row].image)
        
        
        return cell
        
        
        
    }
        
    }
    
    


