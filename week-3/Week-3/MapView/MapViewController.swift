//
//  MapViewController.swift
//  Week-3
//
//  Created by Kerim Caglar on 4.07.2021.
//

import UIKit
import MapKit

class MapViewController: UIViewController {

    
    @IBOutlet weak var mapView: MKMapView!
    @IBOutlet weak var addressLabel: UILabel!
    
    let locationManager = CLLocationManager()
    var lastLocation: CLLocation?
    
    let myLocation = CLLocation(latitude: 41.03315, longitude: 37.49341)
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        checkLocationServices()
    }
    
    func pinMyLocation() {
        let center = CLLocationCoordinate2D(latitude: myLocation.coordinate.latitude,longitude: myLocation.coordinate.longitude)
        let pin = MKPointAnnotation()
        pin.coordinate = center
        let region = MKCoordinateRegion(center: center,latitudinalMeters: 100,longitudinalMeters: 100)
        mapView.showsUserLocation = true
        mapView.setRegion(region, animated: true)
        mapView.addAnnotation(pin)
        getLocationAddress(location: myLocation)
    }
    
    func getLocationAddress(location: CLLocation) {
        let geoCoder = CLGeocoder()
        geoCoder.reverseGeocodeLocation(location) { (placemarks, error) in

            if let error = error {
                print(error)
                return
            }

            guard let placemark = placemarks?.first else { return }
            let name = placemark.name ?? ""
            let country = placemark.country ?? "Country"
            let city = placemark.administrativeArea ?? "City"
            let state = placemark.subAdministrativeArea ?? "State"

            self.addressLabel.text = "\(name) \(state), \(city), \(country)"
        }
    }
    
    func setupLocationManager() {
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
    }
    
    func showUserLocationCenterMap() {
        if let location = locationManager.location?.coordinate {
            let region = MKCoordinateRegion.init(center: location, latitudinalMeters: 100, longitudinalMeters: 100)
            mapView.setRegion(region, animated: true)
        }
    }
    
    func checkLocationServices() {
        if CLLocationManager.locationServicesEnabled() {
            setupLocationManager()
            checkLocationAuthorization()
        } else {
            //TODO: Kullanıcıya ayarlardan konum servisini açması istenebilir
        }
    }
    
    func checkLocationAuthorization() {
        switch CLLocationManager.authorizationStatus() {
        case .authorizedWhenInUse:
            /*mapView.showsUserLocation = true
            showUserLocationCenterMap()
            locationManager.startUpdatingLocation()*/
        //Pinleme sonrası
            pinMyLocation()
            trackingLocation()
        case .denied:
            break
        case .notDetermined:
            locationManager.requestWhenInUseAuthorization()
        case .authorizedAlways:
            break
        case .restricted:
            break
        }
    }
    
    //Pinlediğim yeri izle
    func trackingLocation() {
        mapView.showsUserLocation = true
        showUserLocationCenterMap()
        locationManager.startUpdatingLocation()
        lastLocation = getCenterLocation(mapView: mapView)
    }
    
    func getCenterLocation(mapView: MKMapView) -> CLLocation {
        let latitude = mapView.centerCoordinate.latitude
        let longitude = mapView.centerCoordinate.longitude
        
        return CLLocation(latitude: latitude, longitude: longitude)
    }

}


extension MapViewController: CLLocationManagerDelegate {
    
    //Pinlemeden önce kullandık
    /*func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let location = locations.last else { return }
        let center = CLLocationCoordinate2D(latitude: location.coordinate.latitude, longitude: location.coordinate.longitude)
        let region = MKCoordinateRegion(center: center, latitudinalMeters: 100, longitudinalMeters: 100)
        mapView.setRegion(region, animated: true)
    }*/
    
    func locationManagerDidChangeAuthorization(_ manager: CLLocationManager) {
        checkLocationAuthorization()
    }
    
}

extension MapViewController: MKMapViewDelegate {
    
    func mapView(_ mapView: MKMapView, regionDidChangeAnimated animated: Bool) {
        
        let center = getCenterLocation(mapView: mapView)
        
        guard let lastLocation = lastLocation else { return }
        
        guard center.distance(from: lastLocation) > 30 else { return }
        self.lastLocation = center
        
        getLocationAddress(location: center)
    }
    
}

//MARK: Harita uygulamasında tam adresinizi belirleyecek pinleme yapınız.
