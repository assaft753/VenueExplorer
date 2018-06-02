//
//  ApiResult.swift
//  VenueExplorer
//
//  Created by Assaf Tayouri on 01/06/2018.
//  Copyright © 2018 Assaf Tayouri. All rights reserved.
//

import Foundation

enum ApiResult<T>
{
    case success(T)
    case failure(Error)
}
