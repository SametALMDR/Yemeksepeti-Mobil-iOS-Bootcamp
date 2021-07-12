//
//  User.swift
//  Week-3
//
//  Created by Kerim Caglar on 3.07.2021.
//

import Foundation

struct User: Decodable {
    
    let id: Int
    let name: String
    let email: String
    let company: Company
}

struct Company: Decodable {
    let name: String
}
