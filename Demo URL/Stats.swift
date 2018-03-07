//
//  Stats.swift
//  Demo URL
//
//  Created by Grant Gaurav on 2/19/18.
//  Copyright © 2018 Grant Gaurav. All rights reserved.
//

import Foundation

struct heroStats : Decodable {
    let localized_name : String
    let primary_attr : String
    let attack_type : String
    let legs : Int
    let img : String
    let attack_range : Int
    let roles : [String]
    let icon : String
}

