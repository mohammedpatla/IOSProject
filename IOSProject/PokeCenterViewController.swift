//
//  PokeCenterViewController.swift
//  IOSProject
//
//  Created by Alexander Blankenstein on 12/11/18.
//  Copyright © 2018 Mohammed Patla. All rights reserved.
//

import UIKit

class PokeCenterViewController: UIViewController {

    //MARK: Outlets
    @IBOutlet weak var pokemonName: UILabel!
    @IBOutlet weak var pokemonHP: UILabel!
    @IBOutlet weak var pokemonImage: UIImageView!
    
    var healValue : Int = 30
    
    //MARK: Actions
    @IBAction func healBtnPressed(_ sender: Any) {
        // Just for testing
        pokemonHP.text = "30/30"
        
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
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
