//
//  ViewController.swift
//  AFStarter
//
//  Created by parrot on 2018-11-13.
//  Copyright © 2018 room1. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON
import ChameleonFramework

class ViewController: UIViewController {

    
    @IBAction func getButtonPressed(_ sender: Any) {
        
        let URL = "https://api.darksky.net/forecast/ab7e37126fbeddc41405bc6e414058fe/43.6532,-79.3832?units=ca"
        
        // ALAMOFIRE function: get the data from the website
        Alamofire.request(URL, method: .get, parameters: nil).responseJSON {
            (response) in
            
            // -- put your code below this line
            
            if (response.result.isSuccess) {
                print("awesome, i got a response from the website!")
                print("Response from webiste: " )
                print(response.data)
                
                do {
                    let json = try JSON(data:response.data!)
                    
                    //print(json)
                
                    // PARSING: grab the latitude and longitude
                    print(json["latitude"])
                    print(json["longitude"])
                    
                    
                    //let currently = json["currently"]["temperature"]
                    let temp = json["currently"]["temperature"]
                    
                    print("Tempearture: \(temp)")
                
                }
                catch {
                    print ("Error while parsing JSON response")
                }
                
                
                
                
                
            }
            
        }
        
        // SWIFTYJSON functions: parse the data
        
        
        // SWIFT: do somethign with the data
        
        
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.view.backgroundColor = UIColor.flatGreenDark
        
        let colors:[UIColor] = [
            UIColor(hexString:"#000000")!,
            UIColor(hexString:"#FF0000")!,
            UIColor(hexString:"#FFFFFF")!,
            UIColor(hexString:"#123456")!,
            UIColor(hexString:"#4A412A")!
        ]
        
        self.view.backgroundColor = UIColor(gradientStyle: UIGradientStyle.topToBottom, withFrame: view.frame, andColors: colors)
        
        
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

