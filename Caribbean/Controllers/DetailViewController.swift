//
//  DetailViewController.swift
//  Caribbean
//
//  Created by Habib Miranda-Garcia on 7/3/19.
//  Copyright © 2019 Habib Miranda-Garcia. All rights reserved.
//

import UIKit
import MapKit

class DetailViewController: UIViewController {
    
    @IBOutlet weak var mapView: MKMapView!
    @IBOutlet weak var tableView: UITableView!
    
    func registerTableViewCells() {
        let detailCell = UINib(nibName: navStrings.detailCellNib, bundle: nil)
        self.tableView.register(detailCell, forCellReuseIdentifier: navStrings.detailCellID)
    }
    
    var countryLocation: CLLocation = CLLocation(latitude: 33.6595, longitude: 117.9988)
    let regionRadius: CLLocationDistance = 45000

    
    var country: Country?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let latLong = country?.latlng {
            countryLocation = CLLocation(latitude: latLong[0], longitude: latLong[1])
        }
        self.registerTableViewCells()
        centerMapOnLocation(location: countryLocation)
        
        tableView.dataSource = self
        tableView.rowHeight = tableView.bounds.height / 5
        
        navigationItem.title = country?.name ?? "Country"

    }
}

// MARK: Map setup
extension DetailViewController {
    
    func centerMapOnLocation(location: CLLocation) {
        let coordinateRegion = MKCoordinateRegion(center: location.coordinate, latitudinalMeters: regionRadius, longitudinalMeters: regionRadius)
        mapView.setRegion(coordinateRegion, animated: true)
    }
}

// MARK: TableView setup

extension DetailViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: navStrings.detailCellID, for: indexPath) as! DetailTableViewCell
        cell.backgroundColor = colors[indexPath.row % colors.count]
        cell.titleLabel.text = country?.detailRepresentation[indexPath.row].title
        cell.detailLabel.text = country?.detailRepresentation[indexPath.row].value
        return cell
    }
    
    
}
