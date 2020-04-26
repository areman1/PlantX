//
//  TempChangeViewController.swift
//  PlantX
//
//  Created by Abhinav Emani on 4/26/20.
//  Copyright © 2020 Abhinav Emani. All rights reserved.
//

import UIKit

class TempChangeViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        currTemp.text = String(tempData)
        ideaTemp.text = String(defaultTemp)
                
                    
                if (tempData > defaultTemp) {
                    changePara.text = "At the current conditions the temperature is higher than your plant's ideal conditions. It is recommended that you spray water and provide shade."
                } else if (tempData < defaultTemp) {
                    changePara.text = "At the current conditions the temperature is lower than your plant's ideal conditions. It is recommended that you move your plant to a warmer area."
                } else {
                    changePara.text = "The current temperatute is well suited for your plant."
                }
            }
                
        
        
    @IBOutlet weak var currTemp: UILabel!
    @IBOutlet weak var ideaTemp: UILabel!
    
       
    @IBOutlet weak var changePara: UILabel!
    


}
