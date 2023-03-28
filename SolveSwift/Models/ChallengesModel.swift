//
//  ChallengesModel.swift
//  SolveSwift
//
//  Created by Евгений Басистый on 24.03.2023.
//

import Foundation

class ChallengesModel : ObservableObject{
    @Published var challenges = [Challenge]()
    
    init(challenges: [Challenge] = [Challenge]()) {
        self.challenges = challenges
        self.loadChallenges()
    }
    
    func loadChallenges(){
        if let url = Bundle.main.url(forResource: "Challenges", withExtension: "json") {
            do {
                let data = try Data(contentsOf: url)
                let decoder = JSONDecoder()
                let jsonData = try decoder.decode([Challenge].self, from: data)
                challenges = jsonData
            } catch {
                print("error:\(error)")
            }
        }
    }
    

}
