//
//  Models.swift
//  MVVMexample
//
//  Created by 宇宣 Chen on 2021/2/21.
//

import Foundation
//model
enum Gender {
    case male, female, unspecified
}


struct Person {
    let name:String
    let birthdate: Date?
    let middlename: String?
    let address: String?
    let gender: Gender
    
    var username = "Tony"
    
    init(name: String,
         birthdate: Date? = nil,
         middlename: String? = nil,
         address: String? = nil,
         gender: Gender = .unspecified)
    {
        self.name = name
        self.birthdate = birthdate
        self.middlename = middlename
        self.address = address
        self.gender = gender
    }
}
