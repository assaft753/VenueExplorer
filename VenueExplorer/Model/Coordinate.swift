//
//  Coordinate.swift
//  VenueExplorer
//
//  Created by Assaf Tayouri on 30/03/2018.
//  Copyright © 2018 Assaf Tayouri. All rights reserved.
//

import Foundation

struct Coordinate:CustomStringConvertible {
    let lat:Double
    let lng:Double
    var description: String
    {
        return "\(lat),\(lng)"
    }

}

