//
//  MapViewController.swift
//  IOSProject
//
//  Created by Deivis Dervinis on 12/4/18.
//  Copyright © 2018 Mohammed Patla. All rights reserved.
//

import UIKit

class MapViewController: UIViewController {

    //MARK: Variables
    var enHP = 30
    var userHP = 30
    var enStartHP = 0
    var userStartHP = 0
    var miss = (arc4random() % 100)
    var serverName = ""
    
    //MARK: Outlets
    @IBOutlet weak var enemyName: UILabel!
    @IBOutlet weak var enemyHP: UILabel!
    @IBOutlet weak var enemyImage: UIImageView!
    @IBOutlet weak var userPokeName: UILabel!
    @IBOutlet weak var userPokeHP: UILabel!
    @IBOutlet weak var userPokeImage: UIImageView!
    
    //MARK: Actions
    @IBAction func attack1BtnPressed(_ sender: Any) {
        //create random chance to miss
        miss = (arc4random() % 100)
        //if miss do nothing
        if(miss<=10){
            let popup = UIAlertController(title: "Attack failed!", message: "You were not fast enough", preferredStyle: .alert)
            let okButton = UIAlertAction(title: "OK", style: .default, handler: nil)
            popup.addAction(okButton)
            // 4. Show the alert box!
            present(popup, animated:true)
        } else {
            //if hit calculate attack
            enHP = enHP-2
            enemyHP.text = "HP   \(enHP)/30"
        }
        
        //see if enemy is dead
        if(enHP<=0){
            let popup = UIAlertController(title: "You Win!", message: "Great Job", preferredStyle: .alert)
            let yayButton = UIAlertAction(title: "YAY!", style: .default, handler: {
                // mandatory line for creating a closure in swift
                action in
                
                // in a navigation controller, this command will go back to the previous screen
                self.navigationController?.popViewController(animated: true)
            })
            
            popup.addAction(yayButton)
            // 4. Show the alert box!
            present(popup, animated:true)
            
        } else {
            //let enemy attack
            enemyAttack()
        }
    }
    @IBAction func attack2BtnPressed(_ sender: Any) {
        //create random chance to miss
        miss = (arc4random() % 100)
        //if miss do nothing
        if(miss<=10){
            let popup = UIAlertController(title: "Attack failed!", message: "You were not fast enough", preferredStyle: .alert)
            let okButton = UIAlertAction(title: "OK", style: .default, handler: nil)
            popup.addAction(okButton)
            // 4. Show the alert box!
            present(popup, animated:true)
        } else {
            //if hit calculate attack
            enHP = enHP-3
            enemyHP.text = "HP   \(enHP)/30"
        }
        
        //see if enemy is dead
        if(enHP<=0){
            let popup = UIAlertController(title: "You Win!", message: "Great Job", preferredStyle: .alert)
            let yayButton = UIAlertAction(title: "YAY!", style: .default, handler: {
                // mandatory line for creating a closure in swift
                action in
                
                // in a navigation controller, this command will go back to the previous screen
                self.navigationController?.popViewController(animated: true)
            })
            
            popup.addAction(yayButton)
            // 4. Show the alert box!
            present(popup, animated:true)
            
        } else {
            //let enemy attack
            enemyAttack()
        }
    }
    @IBAction func attack3BtnPressed(_ sender: Any) {
        //create random chance to miss
        miss = (arc4random() % 100)
        //if miss do nothing
        if(miss<=10){
            let popup = UIAlertController(title: "Attack failed!", message: "You were not fast enough", preferredStyle: .alert)
            let okButton = UIAlertAction(title: "OK", style: .default, handler: nil)
            popup.addAction(okButton)
            // 4. Show the alert box!
            present(popup, animated:true)
        } else {
            //if hit calculate attack
            enHP = enHP-4
            enemyHP.text = "HP   \(enHP)/30"
        }
        
        //see if enemy is dead
        if(enHP<=0){
            let popup = UIAlertController(title: "You Win!", message: "Great Job", preferredStyle: .alert)
            let yayButton = UIAlertAction(title: "YAY!", style: .default, handler: {
                // mandatory line for creating a closure in swift
                action in
                
                // in a navigation controller, this command will go back to the previous screen
                self.navigationController?.popViewController(animated: true)
            })
            
            popup.addAction(yayButton)
            // 4. Show the alert box!
            present(popup, animated:true)
            
        } else {
            //let enemy attack
            enemyAttack()
        }
    }
    @IBAction func attack4BtnPressed(_ sender: Any) {
        //create random chance to miss
        miss = (arc4random() % 100)
        //if miss do nothing
        if(miss<=10){
            let popup = UIAlertController(title: "Attack failed!", message: "You were not fast enough", preferredStyle: .alert)
            let okButton = UIAlertAction(title: "OK", style: .default, handler: nil)
            popup.addAction(okButton)
            // 4. Show the alert box!
            present(popup, animated:true)
        } else {
            //if hit calculate attack
            enHP = enHP-6
            enemyHP.text = "HP   \(enHP)/30"
        }
        
        //see if enemy is dead
        if(enHP<=0){
            let popup = UIAlertController(title: "You Win!", message: "Great Job", preferredStyle: .alert)
            let yayButton = UIAlertAction(title: "YAY!", style: .default, handler: {
                // mandatory line for creating a closure in swift
                action in
                
                // in a navigation controller, this command will go back to the previous screen
                self.navigationController?.popViewController(animated: true)
            })
            
            popup.addAction(yayButton)
            // 4. Show the alert box!
            present(popup, animated:true)
            
            
        } else {
            //let enemy attack
            enemyAttack()
        }
    }
    
    //RUN AWAY!
    @IBAction func runBtnPressed(_ sender: Any) {
        miss = (arc4random() % 100)
        if(miss<=10){
            let popup = UIAlertController(title: "Run failed!", message: "You were not fast enough", preferredStyle: .alert)
            let okButton = UIAlertAction(title: "OK", style: .default, handler: nil)
            popup.addAction(okButton)
            // 4. Show the alert box!
            present(popup, animated:true)
            
            enemyAttack()
        } else {
            let popup = UIAlertController(title: "RUN!", message: "Are you sure you wish to run away?", preferredStyle: .alert)
            let stayButton = UIAlertAction(title: "Stay", style: .default, handler: nil)
            let runButton = UIAlertAction(title: "Run!", style: .default, handler: {
                // mandatory line for creating a closure in swift
                action in
                
                // in a navigation controller, this command will go back to the previous screen
                self.navigationController?.popViewController(animated: true)
            })
            
            popup.addAction(runButton)
            popup.addAction(stayButton)
            
            // 4. Show the alert box!
            present(popup, animated:true)
        }
        
    }
    
    //Enemy Attack
    func enemyAttack() {
        //create random chance to miss
        miss = (arc4random() % 100)
        //if miss do nothing
        if(miss<=10){
            let popup = UIAlertController(title: "Enemy Attack Failed!", message: "You were too fast!", preferredStyle: .alert)
            let okButton = UIAlertAction(title: "OK", style: .default, handler: nil)
            popup.addAction(okButton)
            // 4. Show the alert box!
            present(popup, animated:true)
        } else {
            //if hit calculate attack
            userHP = userHP-4
            userPokeHP.text = "HP   \(userHP)/30"
        }
        
        //see if your pokemon is dead
        if(userHP<=0){
            let popup = UIAlertController(title: "You died!", message: "Sorry", preferredStyle: .alert)
            let noButton = UIAlertAction(title: "NO!", style: .default, handler: {
                // mandatory line for creating a closure in swift
                action in
                
                // in a navigation controller, this command will go back to the previous screen
                self.navigationController?.popViewController(animated: true)
            })
            
            popup.addAction(noButton)
            // 4. Show the alert box!
            present(popup, animated:true)
            
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 1. Create an alert box object (and configure it)
        let popup = UIAlertController(title: "Server Name.", message: "Please enter the server name below.", preferredStyle: .alert)
        // 2. Add a text box!!!!
        popup.addTextField()
        let cancelButton = UIAlertAction(title: "Cancel", style: .default, handler: nil)  // creating & configuring the button
        let saveButton = UIAlertAction(title: "Save", style: .default, handler: {
            // mandatory line for creating a closure in swift
            action in
            // code for what should happen when you click the button
            self.serverName = popup.textFields?[0].text ?? "DidNotConnect"
        })

        popup.addAction(cancelButton)
        popup.addAction(saveButton)
        // 4. Show the alert box!
        present(popup, animated:true)
        
        
        enStartHP = enHP
        userStartHP = userHP
        
        // Do any additional setup after loading the view.
        enemyHP.text = "HP   \(enHP)/\(enStartHP)"
        userPokeHP.text = "HP   \(userHP)/\(userStartHP)"
        
        // hide the back button
        self.navigationItem.hidesBackButton = true
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
