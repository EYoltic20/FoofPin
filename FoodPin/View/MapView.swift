//
//  MapView.swift
//  FoodPin
//
//  Created by Emilio Y Martinez on 29/08/22.
//

import SwiftUI
import MapKit
struct MapView: View {
    var location : String = ""
    @State  var region = MKCoordinateRegion(
        center: CLLocationCoordinate2D(latitude: 37.334_900,
                                       longitude: -122.009_020),span: MKCoordinateSpan(latitudeDelta: 1.0, longitudeDelta: 1.0))
    var body: some View {
        Map(coordinateRegion: $region)
    }
}

struct MapView_Previews: PreviewProvider {
    static var previews: some View {
        MapView()
    }
}
