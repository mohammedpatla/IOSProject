//
//  SelectionViewController.swift
//  IOSProject
//
//  Created by Deivis Dervinis on 12/8/18.
//  Copyright © 2018 Mohammed Patla. All rights reserved.
//

import UIKit

class SelectionViewController: UIViewController {

    @IBOutlet weak var bulbImg: UIImageView!
    @IBOutlet weak var charImg: UIImageView!
    @IBOutlet weak var sqrtImg: UIImageView!
    
    var bulbFlag = false
    var charFlag = true
    var sqrtFlag = true
    var indigo = UIColor(red: 110/255, green: 182/255, blue: 175/255, alpha: 1)
    var red = UIColor(red: 184/255, green: 39/255, blue: 32/255, alpha: 1)
    
    var pokeSelectionVal = -1
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    


    // In a storyboard-based application, you will often want to do a little preparation before navigation
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?){
        if pokeSelectionVal != -1 && segue.identifier == "segueA"{
            let pokeVal = segue.destination as! MainViewController
            pokeVal.pokemonValue = pokeSelectionVal
        }
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
