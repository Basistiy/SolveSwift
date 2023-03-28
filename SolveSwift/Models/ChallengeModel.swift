//
//  ChallengeModel.swift
//  SolveSwift
//
//  Created by Евгений Басистый on 24.03.2023.
//

import Foundation


class ChallengeModel : ObservableObject{
    var id : Int
    @Published var challengeText = ""
    @Published var challengeDescription = ""
    var chellengeSolutions: [String] = []
    
    init(id: Int, challengeText: String = "", challengeDescription: String = "") {
        self.id = id
        self.challengeText = challengeText
        self.challengeDescription = challengeDescription
    }
    
    
}
