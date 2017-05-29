//
//  ConfirmSelectionViewController.swift
//  moovelCodingExercise
//
//  Created by Sanjay Shrestha on 5/28/17.
//  Copyright © 2017 Sanjay Shrestha. All rights reserved.
//

import UIKit

class ConfirmSelectionViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!

    @IBOutlet weak var confirmPressed: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "Confirm Selection"
        tableView.dataSource = self
        tableView.delegate = self
        tableView.reloadData()
    }
    
    
    @IBAction func confirmPressed(_ sender: Any) {
        //Do stuff for confirmation
    }


}
extension ConfirmSelectionViewController: UITableViewDataSource, UITableViewDelegate{
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: ConfirmTableViewCell = tableView.dequeueReusableCell(withIdentifier: "ConfirmCell") as! ConfirmTableViewCell
        cell.mainText?.text = "Hi"

        return cell
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        performSegue(withIdentifier: "toFare", sender: nil)
    }
}
