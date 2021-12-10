//
//  MainViewController.swift
//  ForeFlightWeather
//
//  Created by Adam Roney on 12/3/21.
//

import UIKit
import SwiftUI

class MainViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
	
	//MARK: Outlets
	@IBOutlet weak var locationsTableView: UITableView!
	@IBOutlet weak var locationTextField: UITextField!
	
	var locations: [String] = []
	
	override func viewDidLoad() {
		super.viewDidLoad()
		locationsTableView.delegate = self
		locationsTableView.dataSource = self
		
		if let userLocations = UserDefaults.standard.array(forKey: "locations") as? [String]{
			locations = userLocations
		}
	}
	
	//MARK: Table view functions
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		if let locations = UserDefaults.standard.array(forKey: "locations") {
			return locations.count
		} else {
			return 0
		}
	}
	
	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		let cell = tableView.dequeueReusableCell(withIdentifier: "locationCell", for: indexPath)
		cell.textLabel?.text = locations[indexPath.row].uppercased()
		return cell
	}
	
	//MARK: Helper functions
	func addLocation(_ location: String, _ report: Report) {
		if !locations.contains(location) {
			locations.append(location)
			UserDefaults.standard.set(locations, forKey: "locations")
			locationsTableView.reloadData()
		} else {
			handleError("Location already added")
		}
	}
	
	func handleError(_ message: String) {
		let alert = UIAlertController(title: "Location Error", message: message, preferredStyle: .alert)
		alert.addAction(UIAlertAction(title: "Ok", style: .cancel, handler: nil))
		self.present(alert, animated: true, completion: nil)
	}
	
	
	//MARK: Action functions
	//Try to look up the location entered
	@IBAction func submitButtonTapped(_ sender: Any) {
		if let location = locationTextField.text?.lowercased() {
			DataFetcher().fetchData(location) { [self] responseMessage, report in
				if let report = report {
					DispatchQueue.main.sync {
						self.addLocation(location, report)
						let detailView = DetailView(report: report, name: location.uppercased())
						self.navigationController?.pushViewController(UIHostingController(rootView: detailView), animated: true)
					}
				} else {
					DispatchQueue.main.sync {
						handleError(responseMessage)
					}
				}
			}
		}
	}
}

