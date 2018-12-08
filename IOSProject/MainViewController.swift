//
//  MainViewController.swift
//  IOSProject
//
//  Created by Deivis Dervinis on 12/4/18.
//  Copyright © 2018 Mohammed Patla. All rights reserved.
//

import UIKit
import CoreData

class MainViewController: UIViewController {

    @IBOutlet weak var partyButton: UILabel!
    @IBOutlet weak var bagButton: UILabel!
    @IBOutlet weak var saveButton: UILabel!
    @IBOutlet weak var exitButton: UILabel!
    
    @IBOutlet var partyHint: UILongPressGestureRecognizer!
    @IBOutlet var bagHint: UILongPressGestureRecognizer!
    @IBOutlet var saveHint: UILongPressGestureRecognizer!
    @IBOutlet var exitHint: UILongPressGestureRecognizer!
    
    var jsonResult: AnyObject? = nil
    var pokemon: Pokemon!
    
    // Pokemon Value
    var pokemonValue = -1
    
    var context: NSManagedObjectContext!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("Poke value \(pokemonValue)")

        // Do any additional setup after loading the view.
        let url = URL(string: "https://pokeapi.co/api/v2/pokemon/7")
        let task = URLSession.shared.dataTask(with: url!){(data, response, error) in
            if error != nil{
                print(error!)
            }else{
                if let urlContent = data{
                    do{
                        self.jsonResult = try JSONSerialization.jsonObject(with: urlContent, options: JSONSerialization.ReadingOptions.mutableContainers) as AnyObject
                        //print(jsonResult)
                        print("You picked \(self.jsonResult!["name"]!)")
                    }
                    catch{
                        print("Something failed")
                    }
                }
            }
        }
        task.resume()
        
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else { return }
        context = appDelegate.persistentContainer.viewContext
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "partyIdentifier"{
        // tell swift where to send the data
        let partyVal = segue.destination as! PartyViewController
        partyVal.pokeName = "Squirtle"
        //partyVal.pokeName = jsonResult!["name"]! as! String
        }
        else if segue.identifier == "mapIdentifier"{
            // Do map stuff
            
        }
        
        
    }
    
    

    @IBAction func partyPressed(_ sender: Any) {
        partyButton.isHidden = false
        
        if(partyHint.state == .ended){
            partyButton.isHidden = true
        }
    }
    
    @IBAction func bagPressed(_ sender: Any) {
        bagButton.isHidden = false
        
        if(bagHint.state == .ended){
            bagButton.isHidden = true
        }
    }
    
    @IBAction func savePressed(_ sender: Any) {
        saveButton.isHidden = false
        
        if(saveHint.state == .ended){
            saveButton.isHidden = true
        }
    }
    
    @IBAction func exitPressed(_ sender: Any) {
        exitButton.isHidden = false
        
        if(exitHint.state == .ended){
            exitButton.isHidden = true
        }
    }
    
}
