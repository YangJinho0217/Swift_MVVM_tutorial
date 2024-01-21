//
//  WheatherViewModel.swift
//  MVVM_tutorial
//
//  Created by 양진호 on 1/10/24.
//

import Foundation
import SwiftyJSON

class WeatherViewModel {
    
    var minTaString : String = WeatherModel.WeatherData().minTa
    var maxTaString : String = WeatherModel.WeatherData().maxTa
    
    var minTa : String {
        return self.minTaString
    }
    
    var maxTa : String {
        return self.maxTaString
    }
    
    
}
