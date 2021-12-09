//
//  DetailView.swift
//  ForeFlightWeather
//
//  Created by Adam Roney on 12/4/21.
//

import SwiftUI
import MapKit

struct DetailView: View {
	var report: Report
	var name: String
	
    var body: some View {
		VStack {
			MapView(region: MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: report.conditions.lat, longitude: report.conditions.lon), span: MKCoordinateSpan(latitudeDelta: 0.2, longitudeDelta: 0.2)))
				.frame(height: 250)
			Text("  \(name)  ")
				.font(.system(size: 44))
				.background(headerBackground)
				.offset(y: -50)
			Spacer()
		}
		.onAppear {
			print(report.conditions)
		}
    }
	
	var headerBackground: some View {
		RoundedRectangle(cornerRadius: 5.0).fill(Color(UIColor.systemBackground))
	}
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
		DetailView(report: Report(conditions: Conditions(lat: 0, lon: 0, elevationFt: 0, tempC: 0, dewpointC: 0, pressureHg: 0, densityAltitudeFt: 0, relativeHumidity: 0, flightRules: "", cloudLayers: [CloudLayers(coverage: "", altitudeFt: 0, ceiling: false)], cloudLayersV2: [CloudLayers(coverage: "", altitudeFt: 0, ceiling: false)], visibility: Visibility(distanceSm: 0, prevailingVisSm: 0), wind: Wind(speedKts: 0, direction: 0, from: 0, variable: false), remarks: nil, period: nil), forecast: Forecast(period: Period(dateStart: "", dateEnd: ""), conditions: [Conditions(lat: 0, lon: 0, elevationFt: 0, tempC: 0, dewpointC: 0, pressureHg: 0, densityAltitudeFt: 0, relativeHumidity: 0, flightRules: "", cloudLayers: [CloudLayers(coverage: "", altitudeFt: 0, ceiling: false)], cloudLayersV2: [CloudLayers(coverage: "", altitudeFt: 0, ceiling: false)], visibility: Visibility(distanceSm: 0, prevailingVisSm: 0), wind: Wind(speedKts: 0, direction: 0, from: 0, variable: false), remarks: nil, period: nil)])), name: "KATL")
    }
}
