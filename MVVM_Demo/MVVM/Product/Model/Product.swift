//
//  Model.swift
//  MVVM_Demo
//
//  Created by Touseef Sarwar on 09/06/2023.
//

import Foundation


struct Product: Decodable{
    let id: Int
    let title: String
    let category: String
    let description: String
    let price : Float
    let rating : Rate
    let image: String

    
}

struct Rate : Decodable{
    let rate: Float
    let count: Int
}
