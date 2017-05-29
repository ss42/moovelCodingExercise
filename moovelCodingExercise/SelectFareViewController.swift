//
//  SelectFareViewController.swift
//  moovelCodingExercise
//
//  Created by Sanjay Shrestha on 5/28/17.
//  Copyright © 2017 Sanjay Shrestha. All rights reserved.
//

import UIKit

class SelectFareViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    var currentRider = Rider()
    var sendTicket = Ticket()

    override func viewDidLoad() {
        super.viewDidLoad()

        navigationItem.title = "Select Fare"
        tableView.dataSource = self
        tableView.delegate = self
        tableView.reloadData()
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toConfirm"{
            if let toVC = segue.destination as? ConfirmSelectionViewController {
                toVC.ticket = sendTicket
                toVC.currentRider = currentRider
            }
        }
        
        
    }


}
extension SelectFareViewController: UITableViewDataSource, UITableViewDelegate{
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "SelectFareCell")
        let ticket = currentRider.tickets[indexPath.row] as Ticket
        cell?.textLabel?.text = ticket.type
        cell?.detailTextLabel?.text = "$" + String(format: "%.2f", ticket.price)
        return cell!
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return currentRider.tickets.count
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        sendTicket = currentRider.tickets[indexPath.row] as Ticket
        performSegue(withIdentifier: "toConfirm", sender: nil)
    }
}

