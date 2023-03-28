//
//  Challenge.swift
//  SolveSwift
//
//  Created by Евгений Басистый on 24.03.2023.
//

import Foundation

struct Challenge : Identifiable, Decodable, Equatable{
    let id : Int
    let name : String
    let category : String
    let question : String
    let edit : String
    let solutions : [String]
    let hint : String
}
