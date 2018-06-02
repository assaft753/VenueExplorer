//
//  FourSquareClient.swift
//  VenueExplorer
//
//  Created by Assaf Tayouri on 01/06/2018.
//  Copyright © 2018 Assaf Tayouri. All rights reserved.
//

import Foundation

class FourSquareClient {
    let clientId:String
    let clientSecret:String
    
    init(clientId:String,clientSecret:String) {
        self.clientId = clientId
        self.clientSecret = clientSecret
    }
    
    func fetchVenueFor(coordinate: Coordinate,query:String? = nil,searchRadius:Int? = nil,completion: @escaping (ApiResult<[Venue]>) -> Void) {
        let searchEndPoint = FourSquareEndPoint.search(clientID: self.clientId, clientSecret: self.clientSecret, coordinate: coordinate, query: query, searchRadius: searchRadius)
        let urlRequest = searchEndPoint.request
        let networkProccessing = NetworkProcessing(request: urlRequest)
        networkProccessing.DownloadJSON { (data, responde, error) in
            if let error = error
            {
                DispatchQueue.main.async {
                    completion(ApiResult.failure(error))
                }
            }
            else
            {
                if let json = data
                {
                    if let venueDic = ((json["response"] as? [String:Any])?["venues"]) as? [[String:Any]]
                    {
                        let venues = venueDic.compactMap{ venueDic in
                            return Venue(json: venueDic)
                        }
                        DispatchQueue.main.async {
                            completion(ApiResult.success(venues))
                        }
                    }
                    else
                    {
                        let error = NSError(domain: "error with json", code: 10, userInfo: nil)
                        DispatchQueue.main.async {
                            completion(ApiResult.failure(error))
                        }
                    }
                }
            }
        }
    }
}
