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
        
        let baseURL="https://api.foursquare.com/v2/"
        let path="venues/search?ll=\(lat),\(lan)&client_id=4THX0X2VG2QU0VXWEZTUUA5HDRLD1MYDRXQZU5KAPT5CTVJF&client_secret=RZVE20W4ZRQKLO3NQSUDJFZEV1LVJGZI0U4PDW2LXZBUGZU4&v=20180330"
        let url="\(baseURL)\(path)"
        let urlRequest=URLRequest(url: URL(string: url)!)
        let networkProcessing:NetworkProcessing=NetworkProcessing(request: urlRequest)
        networkProcessing.DownloadJSON { (dicJSON,httpRespond,error) in
            print(((dicJSON?["response"] as? [String:Any])?["venues"]) as? NSArray)
        }
    }
    
    
}

