//
//  HintView.swift
//  SolveSwift
//
//  Created by Евгений Басистый on 27.03.2023.
//

import SwiftUI

struct HintView: View {
    let hint : String
    var body: some View {
        VStack{
            Text("Hint : \(hint)").padding()
            Spacer()
        }
    }
}

struct HintView_Previews: PreviewProvider {
    static var previews: some View {
        HintView(hint: "Hint here")
    }
}
