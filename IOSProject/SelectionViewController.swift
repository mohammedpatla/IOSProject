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
    
    //MARK: UserSelection
    var pokeSelectionVal = -1
    
    override func viewDidLoad() {
        super.viewDidLoad()

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
        
        db.collection("userPokemons").document(userEmail).setData([
            //"userID": String(userEmail),
            "pokemonValue":pokeSelectionVal
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
