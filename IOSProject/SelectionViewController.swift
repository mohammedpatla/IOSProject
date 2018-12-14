//
//  SelectionViewController.swift
//  IOSProject
//
//  Created by Deivis Dervinis on 12/8/18.
//  Copyright © 2018 Mohammed Patla. All rights reserved.
//

import UIKit
import Firebase
import FirebaseAuth
import WebKit
import CoreData

class SelectionViewController: UIViewController {

    //MARK: Images
    @IBOutlet weak var bulbImg: UIImageView!
    @IBOutlet weak var charImg: UIImageView!
    @IBOutlet weak var sqrtImg: UIImageView!
    
    //MARK: flags
    var bulbFlag = false
    var charFlag = true
    var sqrtFlag = true
    var indigo = UIColor(red: 110/255, green: 182/255, blue: 175/255, alpha: 1)
    var red = UIColor(red: 184/255, green: 39/255, blue: 32/255, alpha: 1)
    
    //Current user
    var userEmail:String = ""
    
    // MARK: Initialize firestore variable
    // ------------------------------------
    var db:Firestore!
    
    //Set of pokemons
    var jsonResult: AnyObject? = nil
    var context: NSManagedObjectContext!
    
    //List of Pokemons the user has
    var pokemonUserList = [Pokemon]()
    //var pokemonUserListObject: AnyObject? = nil
    
    //MARK: UserSelection
    var pokeSelectionVal = -1
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Call API to register random Pokemons for this user
        // Do any additional setup after loading the view.
        let url = URL(string: "https://pokeapi.co/api/v2/pokemon/")
        let task = URLSession.shared.dataTask(with: url!){(data, response, error) in
            if error != nil{
                print(error!)
            }else{
                if let urlContent = data{
                    do{
                        self.jsonResult = try JSONSerialization.jsonObject(with: urlContent, options: JSONSerialization.ReadingOptions.mutableContainers) as AnyObject
                        //jsonResult = jsonResult
                        //var top10 = jsonResult.sort(function(a, b) { return results.Variable1 < b.Variable1 ? 1 : -1; })
                            //.slice(0, 10);
                        print(self.jsonResult)
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

        // ----------------------------------------------------------------------------------------------------
        // Do any additional setup after loading the view.
        //Get user Variable
        let currentUser = Auth.auth().currentUser
        
        if (currentUser != nil) {
            userEmail = currentUser!.email!;
        }
        else{
            userEmail = "unassigned"
        }
        
        // Setup firestore variable
        db = Firestore.firestore()
        
        // OPTIONAL:  Required when dealing with dates that are stored in Firestore
        let settings = db.settings
        settings.areTimestampsInSnapshotsEnabled = true
        db.settings = settings
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    


    // In a storyboard-based application, you will often want to do a little preparation before navigation
    
    @IBAction func onGoPressed(_ sender: Any) {
        
        /*
        var userPokemon:Pokemon
        
        userPokemon.level = 0;
        userPokemon.name = "You do Not have a name"
        userPokemon.health = 0
        userPokemon.kind = Double(pokeSelectionVal)
        //userPokemon.movesURL =
        pokemonUserList.append(userPokemon)
        */
        
        // PARSING TO JSON OBJ
        /*
        //Parse into Json Object
            do{
                self.pokemonUserListObject = try JSONSerialization.jsonObject(with: pokemonUserList, options: JSONSerialization.ReadingOptions.mutableContainers) as AnyObject
                //jsonResult = jsonResult
                //var top10 = jsonResult.sort(function(a, b) { return results.Variable1 < b.Variable1 ? 1 : -1; })
                //.slice(0, 10);
                print(self.jsonResult)
                //commented out
                //print("You picked \(self.jsonResult!["name"]!)")
            }
            catch{
                print("Something failed")
            }*/
        
        
        db.collection("userPokemons").document(userEmail).setData([
            //"userID": String(userEmail),
            "pokemonValue":pokemonUserList,
            "pokemonList": pokemonUserList
            ])
        
        self.performSegue(withIdentifier: "segueC", sender: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?){
        
        //No need to perform this anymore as we just call it from on Button Press as data is loaded automatically from Firebase.
        /*if pokeSelectionVal != -1 && segue.identifier == "segueC"{
            let pokeVal = segue.destination as! UINavigationController
            pokeVal.pokemonValue = pokeSelectionVal
        }*/
    }
    
    // Actions for tapping the faces
    @IBAction func bulbTapped(_ sender: Any) {
        bulbImg.backgroundColor = indigo
        charImg.backgroundColor = red
        sqrtImg.backgroundColor = red
        pokeSelectionVal = 0
    }
    
    @IBAction func charTapped(_ sender: Any) {
        bulbImg.backgroundColor = red
        charImg.backgroundColor = indigo
        sqrtImg.backgroundColor = red
        pokeSelectionVal = 1
    }
    
    @IBAction func sqrtTapped(_ sender: Any) {
        bulbImg.backgroundColor = red
        charImg.backgroundColor = red
        sqrtImg.backgroundColor = indigo
        pokeSelectionVal = 2
    }
}
