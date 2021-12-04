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
	func fetchData() {
		let urlString = "https://qa.foreflight.com/weather/report/kpwm"
		
		guard let url = URL(string: urlString) else {
			//TODO: Handle Error
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
						let conditions = response.report.forecast
						print(conditions)
					} catch {
						print("JSON Decode Error")
					}
				} else {
					print("Session Error: \nStatus code: \(String(describing: response))\nError: \(String(describing: error))")
					DispatchQueue.main.async {
						//TODO: Handle error
						print("session error")
					}
				}
			}.resume()
		}
	}
}
