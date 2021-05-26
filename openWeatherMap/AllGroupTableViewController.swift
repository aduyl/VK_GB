//
//  AllGroupTableViewController.swift
//  openWeatherMap
//
//  Created by Rodion Molchanov on 15.04.2021.
//

import UIKit

class AllGroupTableViewController: UITableViewController {

    let reuseIdentifier = "reuseIdentifier"
    let allGroupToMyGroup = "allGroupToMyGroup"
    
    var allGroup = [Group]()
    var groupToSend: Group?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let group1 = Group(name: "汉语", description: "Клуб китайского языка", groupImage: UIImage(named: "1"))
        let group2 = Group(name: "照片", description: "картиночки", groupImage: UIImage(named: "2"))
        let group3 = Group(name: "云", description: "云爱好者", groupImage: UIImage(named: "3"))
        
        
        self.groupToSend = nil
        let groupArray = [group1, group2, group3]
        self.allGroup = groupArray
        
        
        self.tableView.register(UINib(nibName: "UniversalTableViewCell", bundle: nil), forCellReuseIdentifier: reuseIdentifier)
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return self.allGroup.count
    }

    
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: reuseIdentifier, for: indexPath) as? UniversalTableViewCell else {return UITableViewCell()}

        cell.configure(group: self.allGroup[indexPath.row])

        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100.0
    }
    

    
    override func tableView(_ tableView: UITableView, willSelectRowAt indexPath: IndexPath) -> IndexPath? {
        print("willSelect")
        
        guard let cell = tableView.cellForRow(at: indexPath) as? UniversalTableViewCell,
              let group = cell.saveGroup
        else {return indexPath}
        
        self.groupToSend = group
        performSegue(withIdentifier: allGroupToMyGroup, sender: group)
        return indexPath
    }
    
    
    
    
    
    
    
    
    
    
    
    
    
    /*
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)

        // Configure the cell...

        return cell
    }
    */

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
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
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
