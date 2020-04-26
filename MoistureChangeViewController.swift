//
//  MoistureChangeViewController.swift
//  PlantX
//
//  Created by Abhinav Emani on 4/26/20.
//  Copyright © 2020 Abhinav Emani. All rights reserved.
//

import UIKit

class MoistureChangeViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
            
            currMois.text = String(moistureData)
            ideaMois.text = String(defaultMousture)
        
        print(moistureData)
        print(defaultMousture)
            
            if (moistureData > defaultMousture) {
                changePara.text = "At the current conditions the moisture in soil is higher than your plant's ideal conditions. It is recommended that you skip your next watering session."
            } else if (moistureData < defaultMousture) {
                changePara.text = "At the current conditions the moisture in soil is lower than your plant's ideal conditions. It is recommended that you add about 2 cups of water to your plant."
            } else {
                changePara.text = "The current moisture in soil is well suited for your plant."
            }
        }
        
        @IBOutlet weak var currMois: UILabel!
        @IBOutlet weak var ideaMois: UILabel!
        
        @IBOutlet weak var changePara: UILabel!
        
    }

