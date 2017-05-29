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
