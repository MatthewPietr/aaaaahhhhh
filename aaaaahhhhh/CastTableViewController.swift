//
//  CastTableViewController.swift
//  aaaaahhhhh
//
//  Created by Matthew Pietrucha on 10/29/20.
//

import UIKit

class CastTableViewController: UITableViewController {

    var listArray: [VoiceAct]?
    
    override func viewDidLoad() {
        super.viewDidLoad()


    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return listArray?.count ?? 0
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "castCell", for: indexPath)

        // Configure the cell...
        
        //CAST LIST
        cell.textLabel?.text = "\(listArray?[indexPath.row].voiceActorName ?? "") as"
        
        cell.detailTextLabel?.text = listArray?[indexPath.row].personVoiced

        return cell
    }
    


}
