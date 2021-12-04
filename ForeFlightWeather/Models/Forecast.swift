//
//  Forecast.swift
//  ForeFlightWeather
//
//  Created by Adam Roney on 12/3/21.
//

import Foundation

struct Forecast: Decodable {
	let period: Period
	let conditions: [Conditions]
}

struct Period: Decodable {
	let dateStart: String
	let dateEnd: String
}
