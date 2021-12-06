//
//  DataFetcher.swift
//  ForeFlightWeather
//
//  Created by Adam Roney on 12/3/21.
//

import Foundation

class DataFetcher {
	
	//Fetch Data
	//completion: @escaping (Station) -> ()
	func fetchData(_ icao: String, completion: @escaping (_ requestMessage: String, _ report: Report?) -> ()) {
		let urlString = "https://qa.foreflight.com/weather/report/\(icao)"
		
		guard let url = URL(string: urlString) else {
			//TODO: Handle Error
			completion("URL Error", nil)
			return
		}
		
		var request = URLRequest(url: url)
		request.httpMethod = "GET"
		request.setValue("Application/json", forHTTPHeaderField: "Content-Type")
		request.addValue("1", forHTTPHeaderField: "ff-coding-exercise")
		
		DispatchQueue.main.async {
			URLSession.shared.dataTask(with: request) { (data, response, error) in
				if let status = response as? HTTPURLResponse, let data = data, status.statusCode == 200 && error == nil {
					do {
						let response = try JSONDecoder().decode(Response.self, from: data)
						completion("Success", response.report)
					} catch {
						completion("Data read error", nil)
					}
				} else {
					completion("Invalid icao", nil)
				}
			}.resume()
		}
	}
}
