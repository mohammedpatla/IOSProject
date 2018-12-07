//
//  PartyViewController.swift
//  IOSProject
//
//  Created by Deivis Dervinis on 12/6/18.
//  Copyright © 2018 Mohammed Patla. All rights reserved.
//

import UIKit
import CoreData

class PartyViewController: UITableViewController {
    
    var pokeName: String = ""
    var pokeItems: [String] = []
    var items: [Pokemon] = []

    @IBOutlet weak var nameLabel: UILabel!
    
    var context: NSManagedObjectContext!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print(pokeName)
        pokeItems.append(pokeName)

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
        
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else { return }

        self.context = appDelegate.persistentContainer.viewContext
        
        let fetchRequest:NSFetchRequest<Pokemon> = Pokemon.fetchRequest()
        
        do {
            // Send the "SELECT *" to the database
            //  results = variable that stores any "rows" that come back from the db
            // Note: The database will send back an array of User objects
            // (this is why I explicilty cast results as [User]
            let results = try self.context.fetch(fetchRequest) as [Pokemon]
            
            self.items = results
            
            // Loop through the database results and output each "row" to the screen
            print("Number of items in database: \(results.count)")
            
            
            // DEBUG CODE
            for x in results {
                print("Stuff in db: \(x.name!)")
                
            }
            
        }
        catch {
            print("Error when fetching from database")
        }
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return pokeItems.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "CustomViewCell", for: indexPath)as? CustomViewCell  else {
            fatalError("The dequeued cell is not an instance of CustomViewCell.")
        }
        let pokeRow = pokeItems[indexPath.row]
        cell.pokemonName = pokeRow.name
        
        //cell.textLabel?.text = pokeItems[indexPath.row]
        // Configure the cell...

        return cell
    }
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
