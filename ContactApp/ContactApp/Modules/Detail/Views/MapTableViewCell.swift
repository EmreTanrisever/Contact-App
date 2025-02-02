//
//  MapTableViewCell.swift
//  ContactApp
//
//  Created by Emre Tanrısever on 2.02.2025.
//

import UIKit
import ETCCommonKit
import ETCNetworkKit
import MapKit

final class MapTableViewCell: UITableViewCell {
    
    private let mapView: MKMapView = {
        let mapView = MKMapView()
        mapView.translatesAutoresizingMaskIntoConstraints = false
        return mapView
    }()
    
    required init?(coder: NSCoder) {
        fatalError("init(coder: ) has not been implemented.")
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        configure()
    }
    
    private func configure() {
        isUserInteractionEnabled = false
        contentView.addSubview(mapView)
        mapView.delegate = self
        setConstraints()
    }
    
    private func setConstraints() {
        NSLayoutConstraint.activate([
            mapView.topAnchor.constraint(equalTo: contentView.topAnchor),
            mapView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            mapView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            mapView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
        ])
    }
    
    func anAnAnnotation(lat: Double, lng: Double) {
        let clLocation = CLLocationCoordinate2D(latitude: lat, longitude: lng)
        let span = MKCoordinateSpan(latitudeDelta: 4, longitudeDelta: 4)
        let region = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: lat, longitude: lng), span: span)
        self.mapView.setRegion(region, animated: true)
        let annotation = MKPointAnnotation()
        annotation.coordinate = CLLocationCoordinate2DMake(lat, lng)
        self.mapView.addAnnotation(annotation)
    }
}

extension MapTableViewCell: BaseTableViewCellConfigurable {
    
    func configure(with data: Any) {
        
        if let user = data as? User {
            DispatchQueue.main.async { [weak self] in
                self?.anAnAnnotation(lat: Double(user.address.geo.lat) ?? 0, lng: Double(user.address.geo.lng) ?? 0)
            }
        }
    }
}

extension MapTableViewCell: MKMapViewDelegate {
    
}
