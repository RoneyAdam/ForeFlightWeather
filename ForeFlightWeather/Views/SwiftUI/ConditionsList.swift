//
//  ConditionsList.swift
//  ForeFlightWeather
//
//  Created by Adam Roney on 12/9/21.
//

import SwiftUI

struct ConditionsList: View {
	var conditions: Conditions
    var body: some View {
		List {
			HStack {
				Text("Temp (C):")
				Spacer()
				Text("\(conditions.tempC ?? 0)")
			}
			HStack {
				Text("Dew point:")
				Spacer()
				Text("\(conditions.dewpointC ?? 0)")
			}
			HStack {
				Text("Temp (C):")
				Spacer()
				Text("\(conditions.pressureHg ?? 0)")
			}
		}
    }
}

struct ConditionsList_Previews: PreviewProvider {
    static var previews: some View {
		ConditionsList(conditions: Conditions(lat: 0, lon: 0, elevationFt: 0, tempC: 0, dewpointC: 0, pressureHg: 0, densityAltitudeFt: 0, relativeHumidity: 0, flightRules: "", cloudLayers: [CloudLayers(coverage: "", altitudeFt: 0, ceiling: false)], cloudLayersV2: [CloudLayers(coverage: "", altitudeFt: 0, ceiling: false)], visibility: Visibility(distanceSm: 0, prevailingVisSm: 0), wind: Wind(speedKts: 0, direction: 0, from: 0, variable: false), remarks: nil, period: nil))
    }
}
