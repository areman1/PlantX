//
//  SecondViewController.swift
//  PlantX
//
//  Created by Abhinav Emani on 4/25/20.
//  Copyright © 2020 Abhinav Emani. All rights reserved.
//

import UIKit

/*
 var lightData = 0
 var humidityData = 0
 var moistureData = 0
 var tempData = 0
 */

var defaultLight = 0
var defaultHumidity = 0
var defaultMousture = 0
var defaultTemp = 0

class SecondViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        
        switch(veggieChosen){
        case 0:
            lightI.text = "80+"
            humidityI.text = "65"
            moistureI.text = "80+"
            tempI.text = "64"
            defaultLight = 100
            defaultHumidity = 65
            defaultMousture = 80
            defaultTemp = 64
        case 1:
            lightI.text = "80+"
            humidityI.text = "65"
            moistureI.text = "60-80"
            tempI.text = "68"
            defaultLight = 100
            defaultHumidity = 65
            defaultMousture = 70
            defaultTemp = 68
        case 2:
            lightI.text = "80+"
            humidityI.text = "93"
            moistureI.text = "60-80"
            tempI.text = "73"
            defaultLight = 100
            defaultHumidity = 93
            defaultMousture = 70
            defaultTemp = 73
        case 3:
            lightI.text = "60+"
            humidityI.text = "93"
            moistureI.text = "80+"
            tempI.text = "70"
            defaultLight = 80
            defaultHumidity = 93
            defaultMousture = 80
            defaultTemp = 70
        case 4:
            lightI.text = "80+"
            humidityI.text = "75"
            moistureI.text = "40-60"
            tempI.text = "75"
            defaultLight = 100
            defaultHumidity = 75
            defaultMousture = 50
            defaultTemp = 75
        case 5:
            lightI.text = "60+"
            humidityI.text = "60"
            moistureI.text = "40-60"
            tempI.text = "64"
            defaultLight = 80
            defaultHumidity = 60
            defaultMousture = 50
            defaultTemp = 64
        case 6:
            lightI.text = "90+"
            humidityI.text = "98"
            moistureI.text = "40-60"
            tempI.text = "45"
            defaultLight = 90
            defaultHumidity = 98
            defaultMousture = 50
            defaultTemp = 45
        default:
            lightI.text = "80+"
            humidityI.text = "75"
            moistureI.text = "60-80"
            tempI.text = "55"
            defaultLight = 100
            defaultHumidity = 75
            defaultMousture = 70
            defaultTemp = 55
        }
        
        //light
        if (lightData < (defaultLight - 10)){
            lightRec.text = "Move the plant into more sunlight"
        } else if (lightData > (defaultLight + 10)) {
            lightRec.text = "Move the plant into a bit of shade"
        } else {
            lightRec.text = "The lighting for your plant is all set"
        }
        //humidity
        if (humidityData < (defaultHumidity - 10)){
            humidityRec.text = "Spray some water on your plant"
        } else if (humidityData > (defaultHumidity + 10)) {
            humidityRec.text = "Blow air on your plant from a distance"
        } else {
            humidityRec.text = "The humidity for your plant is all set"
        }
        //moisture
        if (moistureData < (defaultMousture - 10)){
            moistureRec.text = "Add about 2 cups of water to your plant"
        } else if (moistureData > (defaultMousture + 10)) {
            moistureRec.text = "Skip your next watering session"
        } else {
            moistureRec.text = "The moisture for your plant is all set"
        }
        //temp
        if (tempData < (defaultTemp - 10)){
            tempRec.text = "Move the plant to a warmer area"
        } else if (tempData > (defaultTemp + 10)) {
            tempRec.text = "Spray water and provide shade"
        } else {
            tempRec.text = "The temperature for your plant is all set"
        }
               
    }
    
    @IBOutlet weak var lightI: UILabel!
    @IBOutlet weak var humidityI: UILabel!
    @IBOutlet weak var moistureI: UILabel!
    @IBOutlet weak var tempI: UILabel!
    
    @IBOutlet weak var lightRec: UILabel!
    @IBOutlet weak var humidityRec: UILabel!
    @IBOutlet weak var moistureRec: UILabel!
    @IBOutlet weak var tempRec: UILabel!
    
    
    
}

