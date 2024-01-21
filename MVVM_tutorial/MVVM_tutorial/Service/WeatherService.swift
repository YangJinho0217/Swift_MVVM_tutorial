//
//  WeatherService.swift
//  MVVM_tutorial
//
//  Created by 양진호 on 1/9/24.
//

import Foundation
import Alamofire
import SwiftyJSON

class WeatherService {
    
    func requestGET(url : String, parameter : Parameters, success : @escaping(WeatherModel.WeatherData) -> Void) {
        
        let serviceKey = parameter["serviceKey"]!
        let numOfRows = parameter["numOfRows"]!
        let pageNo =  parameter["pageNo"]!
        let dataType = parameter["dataType"]!
        let dataCd = parameter["dataCd"]!
        let dateCd = parameter["dateCd"]!
        let startDt = parameter["startDt"]!
        let endDt = parameter["endDt"]!
        let stnIds = parameter["stnIds"]!
        
        AF.request("\(url)?serviceKey=\(serviceKey)&numOfRows=\(numOfRows)&pageNo=\(pageNo)&dataType=\(dataType)&dataCd=\(dataCd)&dateCd=\(dateCd)&startDt=\(startDt)&endDt=\(endDt)&stnIds=\(stnIds)", 
                   method: .get, parameters: nil, encoding: URLEncoding.default, headers: nil).responseJSON {
            (response) in
            switch response.result {
            case .success(let value) :
                let sampleData = WeatherModel.ResponseData(data: JSON(value))
                print("뭐야씨1발ㄴ")
                print(sampleData)
                let data = WeatherModel.WeatherData(data: JSON(value))
                success(data)
            case .failure(let error) :
                print(error)
            }
            
        }
        
    }
    
}
