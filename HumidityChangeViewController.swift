//
//  HumidityChangeViewController.swift
//  PlantX
//
//  Created by Abhinav Emani on 4/26/20.
//  Copyright © 2020 Abhinav Emani. All rights reserved.
//

import UIKit

class HumidityChangeViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    
            currHum.text = String(humidityData)
            ideHum.text = String(defaultHumidity)
            
                
            if (humidityData > defaultHumidity) {
                changePara.text = "At the current conditions the humidity is higher than your plant's ideal conditions. It is recommended that you blow air on your plant from a distance."
            } else if (humidityData < defaultHumidity) {
                changePara.text = "At the current conditions the humidity is lower than your plant's ideal conditions. It is recommended that you spray some water on your plant."
            } else {
                changePara.text = "The current humidity is well suited for your plant."
            }
        }
            
    @IBOutlet weak var currHum: UILabel!
    @IBOutlet weak var ideHum: UILabel!
    
            
            @IBOutlet weak var changePara: UILabel!
            



}
