# moovelCodingExercise


#Add url in SelectRiderViewController in the following functions.  
DataManager.getRiderInfo(url: "", completion:{(result: [Rider]?) in
            if let riders = result{
                self.riders = riders
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
            }
        })
