//
//  VenueOptions.swift
//  VenueExplorer
//
//  Created by Assaf Tayouri on 02/04/2018.
//  Copyright © 2018 Assaf Tayouri. All rights reserved.
//

import Foundation


//enum VenueOptions -> URLRequest {
//    case Search(coordinate:String,radius:String?,query:String?)
//    
//    var requestURL:URLRequest
//    {
//        var queryURLItems=[URLQueryItem]()
//        switch self {
//        case .Search(let coordinate,let radius,let query):
//            queryURLItems.append(URLQueryItem(name: IDs.coordinate, value: coordinate))
//            queryURLItems.append(URLQueryItem(name: IDs.clientID, value: DefaultValues.clientID))
//            queryURLItems.append(URLQueryItem(name: IDs.clientSecret, value: DefaultValues.clientSecret))
//            queryURLItems.append(URLQueryItem(name: IDs.version, value: DefaultValues.version))
//            queryURLItems.append(URLQueryItem(name: IDs.radius, value: radius ?? DefaultValues.radius))
//            queryURLItems.append(URLQueryItem(name: IDs.query, value: query))
//            queryURLItems.append(URLQueryItem(name: IDs.limit, value: DefaultValues.limit))
//            var components=URLComponents()
//            components.queryItems=queryURLItems
//            
//            return URLRequest(url: <#T##URL#>)
//            
//            
//        }
//    }
//}
//
//struct IDs {
//    static let clientID="client_id"
//    static let clientSecret="client_secret"
//    static let version="v"
//    static let coordinate="ll"
//    static let radius="radius"
//    static let query="query"
//    static let limit="limit"
//}
//
//struct DefaultValues {
//    static let baseURL="https://api.foursquare.com/v2/"
//    static let path="venues/"
//    static let search="search"
//    static let clientID="4THX0X2VG2QU0VXWEZTUUA5HDRLD1MYDRXQZU5KAPT5CTVJF"
//    static let clientSecret="RZVE20W4ZRQKLO3NQSUDJFZEV1LVJGZI0U4PDW2LXZBUGZU4"
//    static let radius="5000"
//    static let limit="50"
//    static let version="20180330"
//}
