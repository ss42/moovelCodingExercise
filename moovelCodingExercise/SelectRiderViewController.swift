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
    
    var riders = [Rider]()
    var currentRider = Rider()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "Select Rider"
        tableView.dataSource = self
        tableView.delegate = self
        tableView.reloadData()
        
        //PROVIDE URL
        
        DataManager.getRiderInfo(url: "", completion:{(result: [Rider]?) in
            if let riders = result{
                self.riders = riders
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
            }
        })
        //loadJson(filename: "fake")

        

    }
    
    //Mark: Test JSON file
    func loadJson(filename fileName: String)  {
        if let url = Bundle.main.url(forResource: fileName, withExtension: "json") {
            if let data = try? Data(contentsOf: url) {
                do {
                    let object = try JSONSerialization.jsonObject(with: data, options: .allowFragments)
                    
                    if let dictionary = object as? [String: Any] {
                        let adult = makeRiderObject(riderType: "Adult", dict: dictionary)
                        let child = makeRiderObject(riderType: "Child", dict: dictionary)
                        let senior = makeRiderObject(riderType: "Senior", dict: dictionary)
                        self.riders.append(adult!)
                        self.riders.append(child!)
                        self.riders.append(senior!)
                        DispatchQueue.main.async {
                            self.tableView.reloadData()
                        }
                        
                        
                    }
                } catch {
                    print("Error!! Unable to parse  \(fileName).json")
                }
            }
        }
        
    }
 //MARK: Used only for test
    func makeRiderObject(riderType: String, dict: jsonDict) -> Rider?{
        if let riderInfo = dict[riderType] as? jsonDict{
            var faresArray = [Ticket]()
            
            if let fares = riderInfo["fares"] as? [jsonDict]{
                for fare in fares{
                    guard let description = fare["description"] as? String else{ continue }
                    guard let price = fare["price"] as? Double else{continue}
                    faresArray.append(Ticket(type: description, price: price))
                }
            }
            var sub = ""
            if let subText = riderInfo["subtext"] as? String{
                sub = subText
                
            }
            print(faresArray[0].price)
            return Rider(age: sub, tickets: faresArray, riderType: riderType)
            
        }
        return nil
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toFare"{
            if let toVC = segue.destination as? SelectFareViewController {
                toVC.currentRider = currentRider
            }
        }
        
        
    }


}
extension SelectRiderViewController: UITableViewDataSource, UITableViewDelegate{
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "SelectRiderCell")
        let rider = riders[indexPath.row] as Rider
        cell?.textLabel?.text = rider.riderType
        cell?.detailTextLabel?.text = rider.ageGroup
        return cell!
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return riders.count
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        currentRider = riders[indexPath.row] as Rider
        performSegue(withIdentifier: "toFare", sender: nil)
    }
}
