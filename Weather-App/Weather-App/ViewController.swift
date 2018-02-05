//
//  ViewController.swift
//  Weather-App-Example
//
//  Created by Steven on 03/02/16.
//  Copyright © 2016 Steven. All rights reserved.
//

import UIKit

class ViewController: UIViewController, WeatherServiceDelegate {
    
    let weatherService = WeatherService()

    @IBOutlet weak var tempLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var cityLabel: UILabel!
    @IBOutlet weak var cityButton: UIButton!
    
    @IBAction func setCityTapped(sender: UIButton) {
        print("πατήθηκε! βουαλα! ;) ")
        openCityAlert()
    }
    
    func openCityAlert(){
        ///Create Alert Controller
    let alert = UIAlertController(title: "City:",
        message: "Enter city name",
        preferredStyle: UIAlertControllerStyle.Alert)
        
        
        //Cancel Choice
        let cancel = UIAlertAction(title: "Cancel",
            style: UIAlertActionStyle.Cancel,
            handler: nil)

        alert.addAction(cancel)
        
        // Done Choice
        let ok = UIAlertAction(title: "Done",
            style: UIAlertActionStyle.Default) { (action : UIAlertAction) -> Void in
            print("ok")
                let textfield=alert.textFields?[0]
                print(textfield?.text!)
                self.cityLabel.text = textfield?.text!
                let cityName = textfield?.text
                self.weatherService.getWeather(cityName!)

        }
        
        alert.addAction(ok)
        
        //placeholder
        alert.addTextFieldWithConfigurationHandler { (textfield:UITextField) -> Void in
            textfield.placeholder="Enter Your City"
        }
        
        self.presentViewController(alert, animated: true, completion: nil)
    
    }
    
    func setWeather(weather: Weather) {
        print(" ** Set Weather")
        print("City:\(weather.cityName) description: \(weather.description) temp: \(weather.temp)")
        cityLabel.text = weather.cityName
        descriptionLabel.text = weather.description
        tempLabel.text = (" \(weather.temp)")
        cityButton.setTitle(weather.cityName, forState: .Normal)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.weatherService.delegate = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

