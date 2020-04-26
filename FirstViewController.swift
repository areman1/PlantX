//
//  FirstViewController.swift
//  PlantX
//
//  Created by Abhinav Emani on 4/25/20.
//  Copyright © 2020 Abhinav Emani. All rights reserved.
//

import UIKit
import Foundation
//import GTMOAuth2

let hour = NSCalendar.current.component(.hour, from: NSDate() as Date)

var lightData = 0
var humidityData = 0
var moistureData = 0
var tempData = 0
//
//var veggieChosen = 0
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



@IBDesignable
class RoundButton: UIButton {
    @IBInspectable var cornerRadius: CGFloat = 0{
        didSet{
            self.layer.cornerRadius = cornerRadius
        }
    }
}
class RoudView: UIView {
    @IBInspectable var cornerRadius: CGFloat = 0{
        didSet{
            self.layer.cornerRadius = cornerRadius
        }
    }
}

@IBDesignable
public class AngleView: UIView {

    @IBInspectable public var fillColor: UIColor = .blue { didSet { setNeedsLayout() } }

    var points: [CGPoint] = [
        .zero,
        CGPoint(x: 1, y: 0),
        CGPoint(x: 1, y: 1),
        CGPoint(x: 0, y: 0.5)
    ] { didSet { setNeedsLayout() } }

    private lazy var shapeLayer: CAShapeLayer = {
        let _shapeLayer = CAShapeLayer()
        self.layer.insertSublayer(_shapeLayer, at: 0)
        return _shapeLayer
    }()

    override public func layoutSubviews() {
        shapeLayer.fillColor = fillColor.cgColor

        guard points.count > 2 else {
            shapeLayer.path = nil
            return
        }

        let path = UIBezierPath()

        path.move(to: convert(relativePoint: points[0]))
        for point in points.dropFirst() {
            path.addLine(to: convert(relativePoint: point))
        }
        path.close()

        shapeLayer.path = path.cgPath
    }

    private func convert(relativePoint point: CGPoint) -> CGPoint {
        return CGPoint(x: point.x * bounds.width + bounds.origin.x, y: point.y * bounds.height + bounds.origin.y)
    }
}

class Transaction {
    var values: String
    
    init(values: String) {
        self.values = values
    }
}

class FirstViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        
        switch(veggieChosen){
        case 0:
            plantTitle.text = "Cucumber"
        case 1:
            plantTitle.text = "Eggplant"
        case 2:
            plantTitle.text = "Tomato"
        case 3:
            plantTitle.text = "Red Pepper"
        case 4:
            plantTitle.text = "Squash"
        case 5:
            plantTitle.text = "Radish"
        case 6:
            plantTitle.text = "Okra"
        default:
            plantTitle.text = "Cantaloupe"
        }
        
        print(hour)
        
        
        var data = readDataFromCSV(fileName: "Datasheet", fileType: "csv")
        data = cleanRows(file: data!)
        let csvRows = csv(data: data!)
        print(csvRows[0][0])
        
        //var array = csvRows[1][0] // UXM n. 166/167
        lightData = Int(csvRows[0][0]) ?? 98
        if (csvRows[1][0] == "Dry"){
            moistureData = 25
        } else if (csvRows[1][0] == "Normal"){
            moistureData = 50
        } else if (csvRows[1][0] == "Damp") {
            moistureData = 75
        } else {
            moistureData = 100
        }
        humidityData = Int(csvRows[2][0]) ?? 50
        tempData = Int(csvRows[3][0]) ?? 78
        
        lighAPI.text = String(lightData)
        humidityAPI.text = String(humidityData)
        moistureAPI.text = String(moistureData)
        tempAPI.text = String(tempData)
    }
    
    func readDataFromCSV(fileName:String, fileType: String)-> String!{
            guard let filepath = Bundle.main.path(forResource: fileName, ofType: fileType)
                else {
                    return nil
            }
            do {
                var contents = try String(contentsOfFile: filepath, encoding: .utf8)
                contents = cleanRows(file: contents)
                return contents
            } catch {
                print("File Read Error for file \(filepath)")
                return nil
            }
        }

    func cleanRows(file:String)->String{
        var cleanFile = file
        cleanFile = cleanFile.replacingOccurrences(of: "\r", with: "\n")
        cleanFile = cleanFile.replacingOccurrences(of: "\n\n", with: "\n")
        //        cleanFile = cleanFile.replacingOccurrences(of: ";;", with: "")
        //        cleanFile = cleanFile.replacingOccurrences(of: ";\n", with: "")
        return cleanFile
    }
    
    func csv(data: String) -> [[String]] {
        var result: [[String]] = []
        let rows = data.components(separatedBy: "\n")
        for row in rows {
            let columns = row.components(separatedBy: ";")
            result.append(columns)
        }
        return result
    }
   
    @IBOutlet weak var plantTitle: UILabel!
    
    @IBOutlet weak var lighAPI: UILabel!
    @IBOutlet weak var humidityAPI: UILabel!
    @IBOutlet weak var moistureAPI: UILabel!
    @IBOutlet weak var tempAPI: UILabel!
    
    func CreateTransactionObject(json: [String: Any]) -> Transaction? {
        guard let values = json["Countries"] as? String
        
        else {
            return nil
        }
        
        let object = Transaction(values: values)
        return object
        
    }
    
    @IBAction func calibratePlantInfo(_ sender: Any) {
        guard let url = URL(string: "https://sheets.googleapis.com/v4/spreadsheets/12I9ovxFhGEVqLJdBd9FSPgfIjvIpBH1VvLOxRJe8Fms/values/Sheetgo_Datasheet?&key=AIzaSyABmhKjlB--x9UR1AxUfLz9jRJ_BR-VLZw") else {return}
        
        let session = URLSession.shared
        session.dataTask(with: url) { (data, response, error) in
            if let response = response {
                //print(response)
            }
            if let data = data{
                //print(data)
                do {
                    let json = try JSONSerialization.jsonObject(with: data, options: []) //as? [String: Any]
                    //print(json)
                    if let dictionary = json as? [String: Any] {
                        //print(dictionary)
                        guard let array = dictionary["values"] as? [Array<Any>] else {
                           return
                        }
                        print(array[1])
                        guard let arraynew = array[1] as? Array<Any> else {
                           return
                        }
                        print(arraynew[0])
                        print(arraynew[1])
                        print(arraynew[2])
                        print(arraynew[3])
                        
                        //----------------------------------------------------
                
                        /*lightData = arraynew[0] ?? 90
                        self.lighAPI.text = lightData as? String
                       if (arraynew[1] as! String == "Dry"){
                            moistureData = 25
                        } else if (arraynew[1] as! String == "Normal"){
                            moistureData = 50
                        } else if (arraynew[1] as! String == "Damp"){
                            moistureData = 75
                        } else {
                            moistureData = 100
                        }
                        humidityData = arraynew[2] as! Int
                        tempData = arraynew[3] as! Int*/
                        //------------------------------------------------------------
                        
                        //self.lighAPI.text = data as? String
                        
                        if let number = dictionary["values"] as? Double {
                            //print(number)
                            
    
                        }
                        
                        for (key, value) in dictionary {
                            //print(key)
                            //print(value)
                        }
                        
                        if let nestedDictionary = dictionary["anotherKey"] as? [String: Any] {
                            
                        }
                    }
                   
                    
                } catch {
                    print(error)
                }
            }
        }.resume()
    
    }
    
    
    
     
    
}

