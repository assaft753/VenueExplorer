//
//  ViewController.swift
//  VenueExplorer
//
//  Created by Assaf Tayouri on 30/03/2018.
//  Copyright © 2018 Assaf Tayouri. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var lat = 40.7484
    var lan:Double = -73.9857
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let url = URL(string:"https://api.foursquare.com/v2/users/self?oauth_token=C1D2Y34EYNHLND3NDGC0P1ITCBAI20OARGG55XABJE2EQVMB&v=20180601")
        {
            let urlRequest = URLRequest(url: url)
            let networkPro = NetworkProcessing(request: urlRequest)
            networkPro.DownloadJSON { (jsonData, response, error) in
                if let data = jsonData
                {
                    print(data)
                    let name = ((data["response"] as! [String:Any])["user"] as! [String:Any])["firstName"] as! String
                    print(name)
                }
                else
                {
                    print(error)
                }
            }
        }
    }
    
    
}

