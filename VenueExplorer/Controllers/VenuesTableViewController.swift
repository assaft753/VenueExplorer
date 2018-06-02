//
//  VenuesTableViewController.swift
//  VenueExplorer
//
//  Created by Assaf Tayouri on 02/06/2018.
//  Copyright © 2018 Assaf Tayouri. All rights reserved.
//

import Foundation
import UIKit

class VenuesTableViewController : UITableViewController
{
    @IBOutlet var venuesTableView: UITableView!
    var venues : [Venue] = []{
        didSet{
            self.tableView.reloadData()
        }
    }
    var coordinate : Coordinate?
    var clientId = "4THX0X2VG2QU0VXWEZTUUA5HDRLD1MYDRXQZU5KAPT5CTVJF"
    var clientSecret = "RZVE20W4ZRQKLO3NQSUDJFZEV1LVJGZI0U4PDW2LXZBUGZU4"
    var fourSquareClient : FourSquareClient!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.coordinate = Coordinate(lat: 40.7, lng: -74)
        self.fourSquareClient = FourSquareClient(clientId: self.clientId, clientSecret: self.clientSecret)
        fetchVenues()
    }
    
    @IBAction func fetchVenues()  {
        if let coordinate = coordinate
        {
            self.fourSquareClient.fetchVenueFor(coordinate: coordinate)
            {result in
                switch result{
                case .success(let venues):
                    self.venues = venues
                    self.refreshControl?.endRefreshing()
                case .failure(let err):
                   let alert = UIAlertController(title: "Error", message: err.localizedDescription, preferredStyle: .alert)
                   self.present(alert, animated: true, completion: nil)
                }
            }
        }
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return venues.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "VenueCell", for: indexPath)
        let venue = venues[indexPath.row]
        cell.textLabel?.text = venue.name
        return cell
    }
    
    
    
    
    
    
    
}
