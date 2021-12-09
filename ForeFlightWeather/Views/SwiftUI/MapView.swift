//
//  MapView.swift
//  ForeFlightWeather
//
//  Created by Adam Roney on 12/8/21.
//

import SwiftUI
import MapKit

struct MapView: View {
	@State var region: MKCoordinateRegion
	   var body: some View {
		   Map(coordinateRegion: $region)
	   }
}

struct MapView_Previews: PreviewProvider {
    static var previews: some View {
		MapView(region: MKCoordinateRegion(
			center: CLLocationCoordinate2D(latitude: 1.0, longitude: 1.0),
   span: MKCoordinateSpan(latitudeDelta: 0.2, longitudeDelta: 0.2)
))
    }
}
