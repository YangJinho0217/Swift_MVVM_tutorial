//
//  WeatherModel.swift
import Foundation
import SwiftyJSON

// API를 통해 받아올 JSON Data의 Model을 설계
struct WeatherModel {
    
    // RsponseData 전체 가져오기
    struct ResponseData {
        var data : JSON = JSON()
        
        init(data : JSON) {
            self.data = data
        }
    }
    
    // RsponseData 중 원하는 데이터만 가져오기
    struct WeatherData {
        
        var resultMsg : String = ""
        var resultCode : String = ""
        var minTa : String = ""
        var maxTa : String = ""
        
        init() { }
        init(data: JSON) {
            resultMsg = data["response"]["header"]["resultMsg"].stringValue
            resultCode = data["response"]["header"]["resultCode"].stringValue
            minTa = data["response"]["body"]["items"]["item"][0]["minTa"].stringValue
            maxTa = data["response"]["body"]["items"]["item"][0]["maxTa"].stringValue
        }
    }
    
}
