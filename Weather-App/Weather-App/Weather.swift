//
//  Weather.swift
//  Weather-App-Example
//
//  Created by Steven on 06/02/16.
//  Copyright © 2016 Steven. All rights reserved.
//

import Foundation


struct Weather {
    let cityName:String
    let description:String
    let temp:Double
    
    init(cityName:String, description:String,temp:Double){
        self.cityName=cityName
        self.description=description
        self.temp=temp
    }
    
}