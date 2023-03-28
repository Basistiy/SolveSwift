//
//  SolutionView.swift
//  SolveSwift
//
//  Created by Евгений Басистый on 27.03.2023.
//

import SwiftUI

struct SolutionView: View {
    let solutions : [String]
    var body: some View {
        ScrollView{
            ForEach(solutions, id: \.self){solution in
                Text(solution).padding()
                Divider()
            }
        }
    }
}

struct SolutionView_Previews: PreviewProvider {
    static var previews: some View {
        SolutionView(solutions: ["Here is a solution"])
    }
}
