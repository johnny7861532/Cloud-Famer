//
//  MapViewContorller.swift
//  foodpin new
//
//  Created by Johnny' mac on 2016/2/18.
//  Copyright © 2016年 Johnny' mac. All rights reserved.
//
import UIKit
import MapKit

class MapViewController: UIViewController, MKMapViewDelegate {
    var farm:Farm!
    //宣告地標變數
    var currentPlacemark:CLPlacemark?
    //宣告Location變數
    let locationManager = CLLocationManager()
    
   
    var currentRoute:MKRoute?
    

    
    @IBOutlet var mapView:MKMapView!
    
        override func viewDidLoad() {
        
        
        
        super.viewDidLoad()
        
        
        // Convert address to coordinate and annotate it on map
        let geoCoder = CLGeocoder()
        
        
        geoCoder.geocodeAddressString(farm.location, completionHandler: {placemarks, error in
            if error != nil {
                print(error)
                return
            }
            
            if let placemarks = placemarks {
                // Get the first placemark
                let placemark = placemarks[0]
                self.currentPlacemark = placemark
                
                
                // Add annotation
                let annotation = MKPointAnnotation()
                annotation.title = self.farm.name
                annotation.subtitle = self.farm.type
                
                if let location = placemark.location {
                    annotation.coordinate = location.coordinate
                    
                    
                    
                    
                   
                    // Display the annotation
                    self.mapView.showAnnotations([annotation], animated: true)
                    self.mapView.selectAnnotation(annotation, animated: true)
                    
                }
               
            }
         
            
        })
        
        // Map customization
        mapView.showsCompass = true
        mapView.showsScale = true
        mapView.showsTraffic = true
        mapView.showsUserLocation = true
       
            
            
        // Set the MKMapViewDelegate
        mapView.delegate = self
        
        //請求使用者授權定位
        locationManager.requestWhenInUseAuthorization()
        let status = CLLocationManager.authorizationStatus()
        if status == CLAuthorizationStatus.AuthorizedWhenInUse{
        self.mapView.showsUserLocation = true
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - MKMapViewDelegate methods
    
    
    func mapView(mapView: MKMapView, viewForAnnotation annotation: MKAnnotation) -> MKAnnotationView? {
        let identifier = "MyPin"
        
        if annotation.isKindOfClass(MKUserLocation) {
            return nil
        }
        
        // Reuse the annotation if possible
        var annotationView:MKPinAnnotationView? = mapView.dequeueReusableAnnotationViewWithIdentifier(identifier) as? MKPinAnnotationView
        
        if annotationView == nil {
            annotationView = MKPinAnnotationView(annotation: annotation, reuseIdentifier: identifier)
            annotationView?.canShowCallout = true
        }
        
        let leftIconView = UIImageView(frame: CGRectMake(0, 0, 53, 53))
        leftIconView.image = UIImage(named: farm.image)
        annotationView?.leftCalloutAccessoryView = leftIconView
        
        
        // Pin color customization
        annotationView?.pinTintColor = UIColor.greenColor()
        // pin draggable
        annotationView?.draggable = true
        //設置掉落效果
        annotationView?.animatesDrop = true
        annotationView?.canShowCallout = true
        
        //dragg後renew
        
        

        
        return annotationView
       
        
           }
    //renew new drag information
    func mapView(mapView: MKMapView, annotationView view: MKAnnotationView, didChangeDragState newState: MKAnnotationViewDragState, fromOldState oldState: MKAnnotationViewDragState) {
        
        if newState == MKAnnotationViewDragState.Ending {
            let annotation = view.annotation
            print("annotation dropped at: \(annotation?.coordinate.latitude),\(annotation?.coordinate.longitude)")
        }
    }
    //renew拖放大頭針位置
    
    /*
    // MARK: - Navigation
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
    // Get the new view controller using segue.destinationViewController.
    // Pass the selected object to the new view controller.
    }
    */
    
    @IBAction func showDirection(sender: AnyObject){
    
    let directionRequest = MKDirectionsRequest()
    //設定intiate點
    directionRequest.source = MKMapItem.mapItemForCurrentLocation()
    let destinationPlacemark = MKPlacemark(placemark: currentPlacemark!)
        directionRequest.destination = MKMapItem(placemark: destinationPlacemark)
        directionRequest.transportType = MKDirectionsTransportType.Automobile
   //方位計算
    let directions = MKDirections(request: directionRequest)
        directions.calculateDirectionsWithCompletionHandler{ (routeResponse, routeError) -> Void in
            
            guard let routeResponse = routeResponse else {
                if let routeError = routeError {
                    print("Error: \(routeError)")
                }
                
                return
    }
            let route = routeResponse.routes[0]
            self.currentRoute = route
            self.mapView.removeOverlays(self.mapView.overlays)
            self.mapView.addOverlay(route.polyline, level: MKOverlayLevel.AboveRoads)
            let rect = route.polyline.boundingMapRect
            self.mapView.setRegion(MKCoordinateRegionForMapRect(rect), animated: true)
            

}


    }
    func mapView(mapView: MKMapView, rendererForOverlay overlay: MKOverlay) -> MKOverlayRenderer {
        let renderer = MKPolylineRenderer(overlay: overlay)
        renderer.strokeColor = UIColor.blueColor()
        renderer.lineWidth = 8.0
        
        return renderer
    }
    
}



