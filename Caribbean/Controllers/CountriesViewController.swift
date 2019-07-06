//
//  CountriesViewController.swift
//  Caribbean
//
//  Created by Habib Miranda-Garcia on 7/3/19.
//  Copyright © 2019 Habib Miranda-Garcia. All rights reserved.
//

import UIKit

class CountriesViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    func registerTableViewCells() {
        let countryCell = UINib(nibName: navStrings.countryCellNib, bundle: nil)
        self.tableView.register(countryCell, forCellReuseIdentifier: navStrings.listCellID)
    }
    
    private var countries: [Country] = []
    var selectedCountryData: Country?
    private var currentCountryIndex = 0
    
    private let countriesAPI = CountriesAPI.shared
    
    override func viewDidLoad() {
        super.viewDidLoad()
        registerTableViewCells()
        getCountries()
        tableView.dataSource = self
        tableView.delegate = self
        tableView.rowHeight = tableView.bounds.height / 4
        self.navigationItem.title = "Countries"
    }
    
    private func getCountries() {
        countriesAPI.getRequest { (allCountries, error) in
            if let error = error {
                print("Get countries error: \(error.localizedDescription)")
                return
            }
            guard let countryList = allCountries  else { return }
            self.countries = countryList
            DispatchQueue.main.async {
                self.countries = countryList
                self.tableView.reloadData()
            }

        }
    }
}

extension CountriesViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return countries.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: navStrings.listCellID, for: indexPath) as! ListTableViewCell
            let row = indexPath.row
            cell.backgroundColor = colors[indexPath.row % colors.count]
            cell.nameLabel!.text = countries[row].name
        return cell
    }
    
    //    MARK: Navigation
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {

        let country = countries[indexPath.row]
        selectedCountryData = country
        performSegue(withIdentifier: navStrings.toCountryDetail, sender: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == navStrings.toCountryDetail {
            let destinationVC = segue.destination as! DetailViewController
            destinationVC.country = selectedCountryData
        }
    }
    
    //    MARK: Simple Cell Animations
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        cell.alpha = 0.2
        countryTableViewAnimation(0, cell, indexPath)
    }
}


