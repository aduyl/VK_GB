//
//  UsersTableViewController.swift
//  openWeatherMap
//
//  Created by Rodion Molchanov on 09.04.2021.
//

import UIKit

class UsersTableViewController: UITableViewController {

    let reuseIdentifier = "reuseIdentifier"
    let fromFriendsToFotoSegue = "fromFriendsToFoto"
    
    public var myFriendsArray = [User]()
    
    func setNewUser(userNumber: Int, name: String, age: Int) -> User {
        var user = User(name: name, age: age)
        
        var imageName = String(userNumber) + "1"
        user.avatar = UIImage(named: imageName)
      
        
        for index in 1...4 {
            imageName = String(userNumber) + String(index)
            if let image = UIImage(named: imageName) {
                user.fotoArray.append(image)
            }
        }
        
        return user
    }
    
    
    
    func firstFillArray() {
        
        let user1 = setNewUser(userNumber: 1, name: "米卡", age: 20)
        let user2 = setNewUser(userNumber: 2, name: "Angelina", age: 25)
        let user3 = setNewUser(userNumber: 3, name: "Naruto", age: 15)
        let user4 = setNewUser(userNumber: 4, name: "Arny", age: 48)
        let user5 = setNewUser(userNumber: 5, name: "Donkey", age: 16)
//        let user6 = setNewUser(userNumber: 6, name: "user1", age: 27)
//        let user7 = setNewUser(userNumber: 7, name: "HulkHogan", age: 67)
//
        let userArray = [user1, user2, user3, user4, user5]
        self.myFriendsArray = userArray
    
    }
    
 
    override func viewDidLoad() {
        super.viewDidLoad()

        firstFillArray()
        self.tableView.register(UINib(nibName: "UniversalTableViewCell", bundle: nil), forCellReuseIdentifier: reuseIdentifier)
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return self.myFriendsArray.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: reuseIdentifier, for: indexPath) as? UniversalTableViewCell else {return UITableViewCell()}

        cell.configure(user: self.myFriendsArray[indexPath.row])

        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100.0
    }
    
    
   
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == fromFriendsToFotoSegue {
            guard let user = sender as? User,
                  let dst = segue.destination as? FotoCollectionViewController
            else {return}
            dst.configure(fotoArray: user.fotoArray)
         }
        
    }
    
    
    override func tableView(_ tableView: UITableView, willSelectRowAt indexPath: IndexPath) -> IndexPath? {
        print("willSelect")
        
        guard let cell = tableView.cellForRow(at: indexPath) as? UniversalTableViewCell,
              let user = cell.saveUser
        else {return indexPath}
       
        performSegue(withIdentifier: fromFriendsToFotoSegue, sender: user)
         
        return indexPath
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
