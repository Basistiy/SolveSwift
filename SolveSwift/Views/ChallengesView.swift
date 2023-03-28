//
//  ChallengesView.swift
//  SolveSwift
//
//  Created by Евгений Басистый on 24.03.2023.
//

import SwiftUI

struct ChallengesView: View {
    @StateObject var model = ChallengesModel()
    var body: some View {
        NavigationView{
            Form{
                ForEach(model.challenges){challenge in
                    NavigationLink(destination: ChallengeView(userText: challenge.edit, challenge: challenge), label:{ Text("\(challenge.id) \(challenge.name)")})
                    
                    
                }
            }
        }
    }
}

struct ChallengesView_Previews: PreviewProvider {
    static var previews: some View {
        ChallengesView()
    }
}
