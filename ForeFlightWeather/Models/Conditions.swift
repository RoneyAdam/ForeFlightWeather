//
//  Conditions.swift
//  ForeFlightWeather
//
//  Created by Adam Roney on 12/3/21.
//

import Foundation

struct Conditions: Decodable, Hashable {
	static func == (lhs: Conditions, rhs: Conditions) -> Bool {
		lhs.tempC == rhs.tempC
	}
	
	func hash(into hasher: inout Hasher) {
		hasher.combine(tempC)
	}
	
	let lat: Double
	let lon: Double
	let elevationFt: Double
	let tempC: Double?
	let dewpointC: Double?
	let pressureHg: Double?
	let densityAltitudeFt: Double?
	let relativeHumidity: Double
	let flightRules: String
	let cloudLayers: [CloudLayers]
	let cloudLayersV2: [CloudLayers]
	let visibility: Visibility
	let wind: Wind
	let remarks: Remarks?
	let period: Period?
}

struct CloudLayers: Decodable {
	let coverage: String
	let altitudeFt: Double
	let ceiling: Bool
}

struct Visibility: Decodable {
	let distanceSm: Double
	let prevailingVisSm: Double
}

struct Wind: Decodable {
	let speedKts: Double
	let direction: Double
	let from: Double
	let variable: Bool
}

struct Remarks: Decodable {
	let precipitationDiscriminator: Bool
	let humanObserver: Bool
	let seaLevelPressure: Double
	let temperature: Double
	let dewpoint: Double
}

