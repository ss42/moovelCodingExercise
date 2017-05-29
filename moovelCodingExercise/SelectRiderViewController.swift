//
//  SelectRiderViewController.swift
//  moovelCodingExercise
//
//  Created by Sanjay Shrestha on 5/28/17.
//  Copyright © 2017 Sanjay Shrestha. All rights reserved.
//

import UIKit

class SelectRiderViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    let riders = ["Adult", "Child", "Senior"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "Select Rider"
        tableView.dataSource = self
        tableView.delegate = self
        tableView.reloadData()
        

    }
    



}
extension SelectRiderViewController: UITableViewDataSource, UITableViewDelegate{
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "SelectRiderCell")
        cell?.textLabel?.text = riders[indexPath.row]
        
        cell?.detailTextLabel?.text = "hello"
        print("Cell")
        return cell!
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return riders.count
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "toFare", sender: nil)
    }
}
