//
//  MainViewController.swift
//  IOSProject
//
//  Created by Deivis Dervinis on 12/4/18.
//  Copyright © 2018 Mohammed Patla. All rights reserved.
//

import UIKit
import CoreData
import Firebase
import FirebaseAuth
import WebKit

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
    
    //Current user
    var userEmail:String = ""
    
    // MARK: Initialize firestore variable
    // ------------------------------------
    var db:Firestore!
    
    // Pokemon Value
    var pokemonValue = -1
    
    //Moved to SelectionView
    //var context: NSManagedObjectContext!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //Get Current User
        let currentUser = Auth.auth().currentUser
        
        if (currentUser != nil) {
            userEmail = currentUser!.email!;
        }
        else{
            userEmail = "unassigned"
        }
        
        // Setup firestore variable
        db = Firestore.firestore()
        
        //Getting Data from Database for every user
        db.collection("userPokemons").getDocuments() {
            (querySnapshot, err) in
            
            // MARK: FB - Boilerplate code to get data from Firestore
            if let err = err {
                print("Error getting documents: \(err)")
            } else {
                for document in querySnapshot!.documents {
                    if(document.documentID == self.userEmail)
                    {
                        print("Got something!")
                        print("\(document.documentID) => \(document.data())")
                        //Assign pokevalue to this instance.
                        // 1. Get one result from database
                        let data = document;
                        print(data["pokemonValue"])
                        self.pokemonValue = data["pokemonValue"] as! Int
                        self.jsonResult = data["pokemonlist"] as AnyObject
                        print(self.pokemonValue)
                    }
                }
            }
        }

        print("Poke value \(self.pokemonValue)")

        //Moved to Selection controller
        /*
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
                        //commented out
                        //print("You picked \(self.jsonResult!["name"]!)")
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
        */
        
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
        if segue.identifier == "pokeCenterSegue"{
            //Passing the Pokemon object to the Poke-Center View
            let pokeCenterViewController = segue.destination as! PokeCenterViewController
            pokeCenterViewController.pokemon = pokemon
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
        self.dismiss(animated: true, completion: nil)
    }
    
    //TODO: this doesn't work - talk to Alex
    @IBAction func exitToLogin(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
}
