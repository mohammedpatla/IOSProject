//
//  PokeCenterViewController.swift
//  IOSProject
//
//  Created by Kenneth Uyabeme on 12/11/18.
//  Copyright © 2018 Mohammed Patla. All rights reserved.
//

import UIKit
// protocol used for sending data back to MainView controller
protocol DataEnteredDelegate: class {
    func updateHealthAfterHealing(info: Int)
}
class PokeCenterViewController: UIViewController {
    //MARK: Variables
    var pokemon: Pokemon!
    var pokemonHealth = 0
    var pokemonName = ""
     var healValue : Int = 30
    weak var delegate: DataEnteredDelegate? = nil
    
    //MARK: Outlets
    @IBOutlet weak var pokemonNamelabel: UILabel!
    @IBOutlet weak var pokemonHP: UILabel!
    @IBOutlet weak var pokemonImage: UIImageView!
    
   
    
    //MARK: Actions
    @IBAction func healBtnPressed(_ sender: Any) {
        //healing Pokemon
        pokemonHealth = pokemonHealth + healValue
        //sending pokemon health value back to the Main View
        delegate?.updateHealthAfterHealing(info: pokemonHealth)
        //Pop up to indicate that the Pokemon is now healed
        let healthPopUp = UIAlertController(title: "\(pokemonName) has been healed", message: "HP: \(pokemonHealth)", preferredStyle: .alert)
        let okButton = UIAlertAction(title: "Ok", style: .default, handler: nil)
        healthPopUp.addAction(okButton)
        present(healthPopUp, animated: true)
        
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Updating the view labels with the pokemon's info
        pokemonNamelabel.text = pokemonName
        pokemonHP.text = "\(pokemonHealth)"
        
        // ***Code to update the pokemon image will go here***
        
        //------------------------------------------------
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    }
   

}
