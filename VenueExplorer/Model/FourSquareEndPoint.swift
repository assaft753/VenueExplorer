//
//  VenueOptions.swift
//  VenueExplorer
//
//  Created by Assaf Tayouri on 02/04/2018.
//  Copyright © 2018 Assaf Tayouri. All rights reserved.
//

import Foundation

enum FourSquareEndPoint
{
    case search(clientID:String,clientSecret:String,coordinate:Coordinate,query:String?,searchRadius:Int?)
    
    var baseUrl:String{
        return "https://api.foursquare.com"
    }
    
    var path:String{
        switch self {
        case .search:
            return "/v2/venues/search"
        }
    }
    
    private struct ParametersKey
    {
        static let clientId = "client_id"
        static let clientSecret = "client_secret"
        static let version = "v"
        static let category = "categoryId"
        static let location = "ll"
        static let query = "query"
        static let limit = "limit"
        static let searchRadius = "radius"
    }
    
    private struct DefaultValues
    {
        static let version = "20180601"
        static let limit = "50"
        static let searchRadius = 2000
    }
    
    var parameters:[String:Any]{
        switch self {
        case .search(let clientID,let clientSecret,let coordinate,let query,let searchRadius):
            var parameters:[String:Any] = [
                ParametersKey.clientId : clientID,
                ParametersKey.clientSecret : clientSecret,
                ParametersKey.version : DefaultValues.version,
                ParametersKey.location : coordinate.description,
                ParametersKey.limit : DefaultValues.limit
            ]
            if let radius = searchRadius{
                parameters[ParametersKey.searchRadius] = radius
            }else{
                parameters[ParametersKey.searchRadius] = DefaultValues.searchRadius
            }
            if let q = query{
                parameters[ParametersKey.query] = q
            }
            
            return parameters
        }
    }
    
    var urlQueryItems:[URLQueryItem]{
        var queryItems = [URLQueryItem]()
        for (key,val) in parameters
        {
            queryItems.append(URLQueryItem(name: key, value: "\(val)"))
        }
        return queryItems
    }
    
    var request:URLRequest{
        var components = URLComponents(string: self.baseUrl)!
        components.path = self.path
        components.queryItems = self.urlQueryItems
        let url = components.url!
        return URLRequest(url: url)
    }
}
