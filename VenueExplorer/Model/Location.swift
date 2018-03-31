//
//  Location.swift
//  VenueExplorer
//
//  Created by Assaf Tayouri on 30/03/2018.
//  Copyright © 2018 Assaf Tayouri. All rights reserved.
//

import Foundation

struct Location {
    let coordinate:Coordinate?
    let distance:Double?
    let countryCode:String?
    let country:String?
    let city:String?
    let streetAddress:String?
    let crossStreet:String?
    let postalCode:String?
    let state:String?
    
    init?(json:[String:Any])
    {
        if let latitude = json["lat"] as? Double,let longitude = json["lng"] as? Double
        {
            self.coordinate=Coordinate(lat: latitude, lng: longitude)
        }
        else
        {
            return nil
        }
        self.distance=json["distance"] as? Double
        self.countryCode=json["countryCode"] as? String
        self.country=json["country"] as? String
        self.city=json["city"] as? String
        self.streetAddress=json["streetAddress"] as? String
        self.crossStreet=json["crossStreet"] as? String
        self.postalCode=json["postalCode"] as? String
        self.state=json["state"] as? String
    }
    
}
