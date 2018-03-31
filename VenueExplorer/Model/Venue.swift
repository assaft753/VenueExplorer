//
//  Venue.swift
//  VenueExplorer
//
//  Created by Assaf Tayouri on 30/03/2018.
//  Copyright © 2018 Assaf Tayouri. All rights reserved.
//

import Foundation

struct Venue {
    let id:String
    let name:String
    let location:Location?
    let categoryName:String
    let checkIns:Int
    let categoryIconURL:URL?
    var categoryIconSize=88
    let url:URL?
    
    init?(json:[String:Any])
    {
        guard let id=json["id"] as? String,
            let name=json["name"] as? String,
            let categories=json["categories"] as? [[String:Any]],
            let category=categories.first,
            let categoryName=category["name"] as? String,
            let stats=json["stats"] as? [String:Any],
            let checkIns=stats["checkinsCount"] as? Int
            else{return nil}
        
        self.id=id
        self.name=name
        self.categoryName=categoryName
        self.checkIns=checkIns
        if let url=json["url"] as? String
        {
            self.url=URL(string: url)
        }
        else
        {
            self.url=nil
        }
        
        if let locDic=json["location"] as? [String:Any]
        {
            self.location=Location(json: locDic)
        }
        else
        {
            self.location=nil
        }
        if let icon = category["icon"] as? [String:Any],
            let prefix=icon["prefix"] as? String,
            let suffix=icon["suffix"] as? String
        {
            let iconURLString="\(prefix)\(self.categoryIconSize)\(suffix)"
            self.categoryIconURL=URL(string: iconURLString)
        }
        else
        {
            self.categoryIconURL=nil
        }
        
        
        
    }
}
