//
//  Rider.swift
//  moovelCodingExercise
//
//  Created by Sanjay Shrestha on 5/28/17.
//  Copyright © 2017 Sanjay Shrestha. All rights reserved.
//

import Foundation



struct Rider{
    var riderType: String?
    var ageGroup: String?
    var tickets: [Ticket]
    init(age: String, tickets: [Ticket], riderType: String ) {
        self.ageGroup = age
        self.tickets = tickets
        self.riderType = riderType
    }
    init() {
        self.ageGroup = ""
        self.tickets = []
        self.riderType = ""
        
    }
    init(json: jsonDict, riderType: String) throws {
        guard let riderInfo = json[riderType] as? jsonDict else { throw SerializationError.empty("Info is missing") }
        var faresArray = [Ticket]()
            
        guard let fares = riderInfo["fares"] as? [jsonDict] else {throw SerializationError.empty("Info is missing")}
        for fare in fares{
            guard let description = fare["description"] as? String else{ continue }
            guard let price = fare["price"] as? Double else{continue}
            faresArray.append(Ticket(type: description, price: price))
        }
        
        var sub = ""
        if let subText = riderInfo["subtext"] as? String{
            sub = subText
                
        }
        self.ageGroup = sub
        self.tickets = faresArray
        self.riderType = riderType

    }
}

struct Ticket{
    var type: String
    var price: Double
    init(type: String, price: Double) {
        self.price = price
        self.type = type
    }
    init() {
        self.price = 0.0
        self.type = ""
    }
}
enum SerializationError: Error {
    case empty(String)
    case invalid(String, Any)
}
