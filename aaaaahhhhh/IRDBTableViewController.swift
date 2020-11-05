//
//  IRDBTableViewController.swift
//  aaaaahhhhh
//
//  Created by Matthew Pietrucha on 10/29/20.
//

import UIKit

class IRDBTableViewController: UITableViewController {

    
    //delete
    //var outerArray = ["First Section Name", "second Section Name"]
    //var innerArray1 = ["first thing", "second thing", "third thing"]
    //var innerArray2 = ["first thing", "second thing", "third thing", "fourth thing"]
    
    var mediaModel: MediaDataModel? {
        didSet {
            tableView.reloadData()
        }
    }
    
    var dataController = DataController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "GAMING"
        
        
        
        // 1
        let nav = self.navigationController?.navigationBar
      
        // 2
        nav?.barStyle = UIBarStyle.black
        nav?.tintColor = UIColor.init(red: 245/255, green: 196/255, blue: 72/255, alpha: 1)
      
        // 3
        let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 100, height: 44))
        imageView.contentMode = .scaleAspectFit
          
        // 4
        let image = UIImage(named: "Unknown")
        imageView.image = image
          
        // 5
        navigationItem.titleView = imageView
        
        //call data controller and wait
        dataController.getJSONData(completion: {dataModel in
            self.mediaModel = dataModel
        })
        
        
        
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        
        return mediaModel?.console.count ?? 0
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return mediaModel?.console[section].games.count ?? 0

    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return mediaModel?.console[section].consoleName
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "mediaCell", for: indexPath)

        // Configure the cell...
        
        cell.textLabel?.text = mediaModel?.console[indexPath.section].games[indexPath.row].gameName
        
        cell.detailTextLabel?.text = mediaModel?.console[indexPath.section].games[indexPath.row].yearShown
        
        return cell
    }

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        
        if segue.identifier == "showMediaDetail" {
            if let indexPath = tableView.indexPathForSelectedRow {
                let selectedObject = mediaModel!.console[indexPath.section].games[indexPath.row]
                let controller = segue.destination as! DetailViewController
                controller.detailItem = selectedObject
                controller.navigationItem.leftBarButtonItem = splitViewController?.displayModeButtonItem
                controller.navigationItem.leftItemsSupplementBackButton = true
                
            }
        }
    }
    

}
