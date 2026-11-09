import SwiftUI
import MapKit
import CoreLocation

extension CLLocationCoordinate2D {
    static let VIPMotors =
        CLLocationCoordinate2D(latitude: 25.1614215, longitude: 55.2332042)
    static let PearlMotors =
        CLLocationCoordinate2D(latitude: 25.1650829, longitude: 55.2369117)
    static let AlKetbiMotors =
        CLLocationCoordinate2D(latitude: 25.168517, longitude: 55.3685347)
    static let MyCarGeneralTrading =
        CLLocationCoordinate2D(latitude: 25.1686814, longitude: 55.367264)
}

struct ContentView: View {
    @ObservedObject var locationManager = LocationManager()

    var body: some View {
        Map(interactionModes: [.pan, .zoom, .pitch]) {
            Marker("VIP Motors", coordinate: .VIPMotors)
            Marker("Pearl Motors - Luxury Automobiles", coordinate: .PearlMotors)
            Marker("Al Ketbi Motors", coordinate: .AlKetbiMotors)
            Marker("My Car General Trading - Caravans Middle East",
                   coordinate: .MyCarGeneralTrading)
        }
        .mapStyle(.standard(elevation: .realistic,
                            pointsOfInterest: .including([.airport, .cafe]),
                            showsTraffic: true))
        .mapControls {
            MapPitchToggle()
            MapUserLocationButton()
            MapCompass()
        }
        .onAppear {
            locationManager.requestPermission()
        }
    }
}

#Preview {
    ContentView()
}


class LocationManager: NSObject, ObservableObject, CLLocationManagerDelegate {
    private let manager = CLLocationManager()

    override init() {
        super.init()
        manager.delegate = self
    }

    // ask the user for pemission
    func requestPermission() {
        manager.requestWhenInUseAuthorization()
    }

    func locationManager(_ manager: CLLocationManager,
                         didChangeAuthorization status: CLAuthorizationStatus) {
        switch status {
        case .notDetermined:
            print("Location permission: not determined.")
        case .restricted, .denied:
            print("Location permission: denied/restricted.")
        case .authorizedWhenInUse, .authorizedAlways:
            print("Location permission: granted.")
        @unknown default:
            print("Unknown authorization status.")
        }
    }
}
