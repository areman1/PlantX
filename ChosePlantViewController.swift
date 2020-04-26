//
//  ChosePlantViewController.swift
//  PlantX
//
//  Created by Abhinav Emani on 4/25/20.
//  Copyright © 2020 Abhinav Emani. All rights reserved.
//

import UIKit

var veggieChosen = -1
/*
 0 - cucumber
 1 - eggplant
 2 - tomato
 3 - red pepper
 4 - squash
 5 - radish
 6 - okra
 7 - cant
 */

class ChosePlantViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBOutlet var cucumber: UIImageView!
    @IBOutlet var eggplant: UIImageView!
    @IBOutlet var tomato: UIImageView!
    @IBOutlet var redpepper: UIImageView!
    @IBOutlet var squash: UIImageView!
    @IBOutlet var radish: UIImageView!
    @IBOutlet var okra: UIImageView!
    @IBOutlet var cant: UIImageView!
    
    
    @IBAction func cucumberClick(_ sender: Any) {
        cucumber.image = UIImage(named: ":cucumber")
        eggplant.image = UIImage(named: "eggplant")
        tomato.image = UIImage(named: "tomato")
        redpepper.image = UIImage(named: "redpepper")
        squash.image = UIImage(named: "squash")
        radish.image = UIImage(named: "radish")
        okra.image = UIImage(named: "okra")
        cant.image = UIImage(named: "cant")
        veggieChosen = 0
    }
    @IBAction func eggplantClick(_ sender: Any) {
        cucumber.image = UIImage(named: "cucumber")
        eggplant.image = UIImage(named: ":eggplant")
        tomato.image = UIImage(named: "tomato")
        redpepper.image = UIImage(named: "redpepper")
        squash.image = UIImage(named: "squash")
        radish.image = UIImage(named: "radish")
        okra.image = UIImage(named: "okra")
        cant.image = UIImage(named: "cant")
        veggieChosen = 1
    }
    @IBAction func tomatoClick(_ sender: Any) {
        cucumber.image = UIImage(named: "cucumber")
        eggplant.image = UIImage(named: "eggplant")
        tomato.image = UIImage(named: ":tomato")
        redpepper.image = UIImage(named: "redpepper")
        squash.image = UIImage(named: "squash")
        radish.image = UIImage(named: "radish")
        okra.image = UIImage(named: "okra")
        cant.image = UIImage(named: "cant")
        veggieChosen = 2
    }
    @IBAction func redpepperClick(_ sender: Any) {
        cucumber.image = UIImage(named: "cucumber")
        eggplant.image = UIImage(named: "eggplant")
        tomato.image = UIImage(named: "tomato")
        redpepper.image = UIImage(named: ":redpepper")
        squash.image = UIImage(named: "squash")
        radish.image = UIImage(named: "radish")
        okra.image = UIImage(named: "okra")
        cant.image = UIImage(named: "cant")
        veggieChosen = 3
    }
    @IBAction func squashClick(_ sender: Any) {
        cucumber.image = UIImage(named: "cucumber")
        eggplant.image = UIImage(named: "eggplant")
        tomato.image = UIImage(named: "tomato")
        redpepper.image = UIImage(named: "redpepper")
        squash.image = UIImage(named: ":squash")
        radish.image = UIImage(named: "radish")
        okra.image = UIImage(named: "okra")
        cant.image = UIImage(named: "cant")
        veggieChosen = 4
    }
    @IBAction func radishClick(_ sender: Any) {
        cucumber.image = UIImage(named: "cucumber")
        eggplant.image = UIImage(named: "eggplant")
        tomato.image = UIImage(named: "tomato")
        redpepper.image = UIImage(named: "redpepper")
        squash.image = UIImage(named: "squash")
        radish.image = UIImage(named: ":radish")
        okra.image = UIImage(named: "okra")
        cant.image = UIImage(named: "cant")
        veggieChosen = 5
    }
    @IBAction func okraClick(_ sender: Any) {
        cucumber.image = UIImage(named: "cucumber")
        eggplant.image = UIImage(named: "eggplant")
        tomato.image = UIImage(named: "tomato")
        redpepper.image = UIImage(named: "redpepper")
        squash.image = UIImage(named: "squash")
        radish.image = UIImage(named: "radish")
        okra.image = UIImage(named: ":okra")
        cant.image = UIImage(named: "cant")
        veggieChosen = 6
    }
    @IBAction func cantClick(_ sender: Any) {
        cucumber.image = UIImage(named: "cucumber")
        eggplant.image = UIImage(named: "eggplant")
        tomato.image = UIImage(named: "tomato")
        redpepper.image = UIImage(named: "redpepper")
        squash.image = UIImage(named: "squash")
        radish.image = UIImage(named: "radish")
        okra.image = UIImage(named: "okra")
        cant.image = UIImage(named: ":cant")
        veggieChosen = 7
    }
    
    @IBAction func choosePlant(_ sender: Any) {
        if (veggieChosen >= 0){
            self.performSegue(withIdentifier: "plantChosen", sender: self)
        } else {
            let alertController = UIAlertController(title: "Error", message: "Please Choose A Plant To Begin", preferredStyle: .alert)
            let defaultAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
                           
             alertController.addAction(defaultAction)
             self.present(alertController, animated: true, completion: nil)
        }
    }
    
}
