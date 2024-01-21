//
//  AppLoadingViewController.swift
//  MVVM_tutorial
//
//  Created by 양진호 on 1/16/24.
//

import UIKit
import CoreLocation
import Alamofire
import SwiftyJSON

class AppLoadingViewController: UIViewController {

    var locationManager = CLLocationManager()
    var latitude : Double = 0
    var longitude : Double = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setLocationManaget()
        getWeather()
    }
    
    func setLocationManaget() {
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.requestWhenInUseAuthorization()
        DispatchQueue.global().async {
            if CLLocationManager.locationServicesEnabled() {
                self.locationManager.startUpdatingLocation()
            } else {
                print("위치 서비스 허용 off")
            }
        }
    }
    
    func getWeather() {
        
        print("getWeather Call")
        
        var param = Parameters()
        
        param = [
            "serviceKey" : "%2B47X5CQ5V9224usAxSI7JRGbX6XtPvnTagCM8ldqX%2B%2Fh47B%2FXK1pm1AP3fWxuZMnKJOHN80dHbZnqR8fjTCT4g%3D%3D",
            "numOfRows" : 10,
            "pageNo" : 1,
            "dataType" : "JSON",
            "dataCd" : "ASOS",
            "dateCd" : "DAY",
            "startDt" : 20240115,
            "endDt" : 20240115,
            "stnIds" : 112
        ]
        
        WeatherService().requestGET(url: "http://apis.data.go.kr/1360000/AsosDalyInfoService/getWthrDataList", parameter: param, success:  {
            response in
            
            if response.resultCode == "00" {
                let weatherVM = WeatherViewModel()
                weatherVM.minTaString = response.minTa
                weatherVM.maxTaString = response.maxTa
                let sb = UIStoryboard(name: "Main", bundle: nil)
                let vc = sb.instantiateViewController(withIdentifier: "Main") as! ViewController
                vc.minTaLabelText = weatherVM.minTa
                vc.maxTaLabelText = weatherVM.maxTa
                vc.modalPresentationStyle = .fullScreen
                self.present(vc, animated: false)
            }
            
        })
        
    }
    
}

extension AppLoadingViewController : CLLocationManagerDelegate {
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if let location = locations.first {
            self.latitude = location.coordinate.latitude
            self.longitude = location.coordinate.longitude
        }
    }
        
    // 위치 가져오기 실패
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print("error")
    }
    
}
