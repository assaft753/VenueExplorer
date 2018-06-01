//
//  NetworkProcessing.swift
//  VenueExplorer
//
//  Created by Assaf Tayouri on 30/03/2018.
//  Copyright © 2018 Assaf Tayouri. All rights reserved.
//

import Foundation

class NetworkProcessing
{
    let request:URLRequest
    lazy var configuration:URLSessionConfiguration=URLSessionConfiguration.default
    lazy var session:URLSession=URLSession(configuration: self.configuration)
    
    init(request:URLRequest)
    {
        self.request=request
    }
    
    func DownloadJSON(_ completion:@escaping ([String:Any]?,HTTPURLResponse?,Error?)->Void)
    {
        let dataTask=session.dataTask(with: self.request){
            (data,response,error) in
            guard let httpRespond=response as? HTTPURLResponse else
            {
                completion(nil,nil,error)
                return
            }
            if data == nil
            {
                if error != nil
                {
                    completion(nil, httpRespond, error)
                }
            }
            else
            {
                switch httpRespond.statusCode
                {
                case 200:
                    do
                    {
                        let json=try JSONSerialization.jsonObject(with: data!, options: []) as? [String:Any]
                        completion(json,httpRespond,nil)
                    }
                    catch let err {
                        completion(nil,httpRespond,err)
                    }
                default:
                    print("\(httpRespond.statusCode)")
                }
            }
        }
        dataTask.resume()
    }
    
    
    
    func DownloadData(_ completion: @escaping (Data?,HTTPURLResponse?,Error?)->Void)
    {
        let dataTask=session.dataTask(with: self.request){
            (data,response,error) in
            guard let httpRespond=response as? HTTPURLResponse else
            {
                completion(nil,nil,error)
                return
            }
            if data == nil
            {
                if error != nil
                {
                    completion(nil, httpRespond, error)
                }
            }
            else
            {
                switch httpRespond.statusCode
                {
                case 200:
                    completion(data,httpRespond,nil)
                default:
                    print("\(httpRespond.statusCode)")
                }
            }
        }
        dataTask.resume()
    }
    
}
