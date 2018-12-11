//
//  MapViewController.swift
//  IOSProject
//
//  Created by Deivis Dervinis on 12/4/18.
//  Copyright © 2018 Mohammed Patla. All rights reserved.
//

import UIKit

class MapViewController: UIViewController {

    //MARK: Outlets
    @IBOutlet weak var enemyName: UILabel!
    @IBOutlet weak var enemyHP: UILabel!
    @IBOutlet weak var enemyImage: UIImageView!
    @IBOutlet weak var userPokeName: UILabel!
    @IBOutlet weak var userPokeHP: UILabel!
    @IBOutlet weak var userPokeImage: UIImageView!
    
    //MARK: Actions
    @IBAction func attackBtnPressed(_ sender: Any) {
        
    }
    
    //RUN AWAY!
    @IBAction func runBtnPressed(_ sender: Any) {
        let popup = UIAlertController(title: "RUN!", message: "Are you sure you wish to run away?", preferredStyle: .alert)
        let stayButton = UIAlertAction(title: "Stay", style: .default, handler: nil)
        let runButton = UIAlertAction(title: "Run!", style: .default, handler: {
            // mandatory line for creating a closure in swift
            action in
            self.dismiss(animated: true, completion: nil)
            //self.performSegue(withIdentifier: "runSegue", sender: nil)
        })
        
        popup.addAction(runButton)
        popup.addAction(stayButton)
        
        // 4. Show the alert box!
        present(popup, animated:true)
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
        // 3.  If matching, then
        //          --> set the data for the next screen
        let menuPage = segue.destination as! MainViewController
    }
    */

}
