//
//  PokeCenterViewController.swift
//  IOSProject
//
//  Created by Kenneth Uyabeme on 12/11/18.
//  Copyright © 2018 Mohammed Patla. All rights reserved.
//

import UIKit

class PokeCenterViewController: UIViewController {
    //MARK: Variables
    var pokemon: Pokemon!
    
    //MARK: Outlets
    @IBOutlet weak var pokemonName: UILabel!
    @IBOutlet weak var pokemonHP: UILabel!
    @IBOutlet weak var pokemonImage: UIImageView!
    
    var healValue : Int = 30
    
    //MARK: Actions
    @IBAction func healBtnPressed(_ sender: Any) {
        // Just for testing
        pokemonHP.text = "30/30"
        
        //Pokemon object does not have a health value, need to add this
        
        //Pop up to indicate that the Pokemon is now healed
        let healthPopUp = UIAlertController(title: "Squirtle has been healed", message: "HP: \(healValue)", preferredStyle: .alert)
        let okButton = UIAlertAction(title: "Ok", style: .default, handler: nil)
        healthPopUp.addAction(okButton)
        present(healthPopUp, animated: true)
      
        
        
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Updating the view labels with the pokemon's info
       //pokemonName.text = pokemon.name
        pokemonName.text = "Squirtle"
        
        // ***Code to update the pokemon image will go here***
        
        //------------------------------------------------
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

}
