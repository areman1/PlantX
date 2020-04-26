//
//  LightChangeViewController.swift
//  PlantX
//
//  Created by Abhinav Emani on 4/26/20.
//  Copyright © 2020 Abhinav Emani. All rights reserved.
//

import UIKit

class LightChangeViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        currLight.text = String(lightData)
        ideaLight.text = String(defaultLight)
        
        if (lightData > defaultLight) {
            changePara.text = "At the current conditions the exposure to light is higher than your plant's ideal conditions. It is recommended that you move your plant into a place with more shade."
        } else if (lightData < defaultLight) {
            changePara.text = "At the current conditions the exposure to light is lower than your plant's ideal conditions. It is recommended that you move your plant into a place with more sunlight."
        } else {
            changePara.text = "The current exposure of light is well suited for your plant."
        }
    }
    
    @IBOutlet weak var currLight: UILabel!
    @IBOutlet weak var ideaLight: UILabel!
    
    @IBOutlet weak var changePara: UILabel!
    
}
