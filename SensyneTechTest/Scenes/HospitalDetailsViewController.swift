//
//  HospitalDetailsViewController.swift
//  SensyneTechTest
//
//  Created by Marko Vukusic on 07/10/2020.
//

import UIKit
import MapKit
import CoreLocation

class HospitalDetailsViewController: UIViewController {
    
    var hospital: HospitalModel?

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var sectorLabel: UILabel!
    @IBOutlet weak var addressLabel: UILabel!
    @IBOutlet weak var cityLabel: UILabel!
    @IBOutlet weak var mapView: MKMapView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        fillData()
        setMap()
    }
    
    func fillData() {
        guard let hospital = hospital else { return }
        title = hospital.organisationName
        nameLabel.text = hospital.organisationName
        sectorLabel.text = hospital.sector
        addressLabel.text = [hospital.address1, hospital.address2, hospital.address3].filter({$0 != ""}).joined(separator: ", ")
        cityLabel.text = [hospital.city, hospital.county, hospital.postcode].filter({$0 != ""}).joined(separator: ", ")
    }
    
    private func setMap() {
        guard let hospital = hospital,
              let latitude = Double(hospital.latitude),
              let longitude = Double(hospital.longitude) else { return }
        let coordinates = CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
        mapView.setCenter(coordinates, animated: false)
        
        let regionRadius: CLLocationDistance = 4000
        let coordinateRegion = MKCoordinateRegion(center: coordinates, latitudinalMeters: regionRadius * 2.0, longitudinalMeters: regionRadius * 2.0)
        mapView.setRegion(coordinateRegion, animated: true)
        
        let annotation = MKPointAnnotation()
        let centerCoordinate = CLLocationCoordinate2D(latitude: latitude, longitude:longitude)
        annotation.coordinate = centerCoordinate
        annotation.title = hospital.organisationName
        mapView.addAnnotation(annotation)
    }
}
