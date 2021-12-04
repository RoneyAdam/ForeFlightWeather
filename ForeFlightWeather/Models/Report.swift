//
//  Report.swift
//  ForeFlightWeather
//
//  Created by Adam Roney on 12/3/21.
//

import Foundation

struct Response: Decodable {
	let report: Report
}

struct Report: Decodable {
	let conditions: Conditions
	let forecast: Forecast
	
}
