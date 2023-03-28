//
//  CheckTextView.swift
//  SolveSwift
//
//  Created by Евгений Басистый on 26.03.2023.
//

import SwiftUI


struct ChallengeView: View {
    @State var userText : String
    let challenge : Challenge
    @State private var showingAlert = false
    @State private var showingAnswer = false
    @State private var showingHint = false
    @State private var alertTitle = ""
    @State private var alertMessage = ""
    @FocusState var isInputActive: Bool
    @State var questionHeight : CGFloat = 100
    
    var body: some View {
        
        VStack() {
            ScrollView{
                Text(challenge.question).padding()}.frame(height: questionHeight)
            
            TextEditor(text: $userText)
                .cornerRadius(8)
                .overlay(
                    RoundedRectangle(cornerRadius: 8)
                        .stroke(Color(UIColor.separator), lineWidth: 1)
                )
                .padding()
                .focused($isInputActive)
                .toolbar(content: {
                    ToolbarItemGroup(placement: .keyboard, content: {
                        Spacer()
                        Button("Done"){
                            isInputActive = false
                        }
                    })
                })
            Spacer()
            if !isInputActive{
                HStack{
                    Button(action: checkText) {
                        Image(systemName: "checkmark")
                            .foregroundColor(.white)
                            .font(.headline)
                            .frame(maxWidth: 100)
                            .frame(height: 44)
                            .background(Color.red)
                            .cornerRadius(8)
                            .padding(.horizontal)
                            .padding(.top, 16)
                    }
                    .padding(.horizontal)
                    .padding(.bottom, 16)
                    
                    Button(action: {self.showingHint = true}) {
                        Image(systemName: "lightbulb")
                            .foregroundColor(.white)
                            .font(.headline)
                            .frame(maxWidth: 100)
                            .frame(height: 44)
                            .background(Color.red)
                            .cornerRadius(8)
                            .padding(.horizontal)
                            .padding(.top, 16)
                    }
                    .padding(.horizontal)
                    .padding(.bottom, 16)
                    .sheet(isPresented: $showingHint, content: {HintView(hint: self.challenge.hint)})
                    
                    
                    Button(action: {self.showingAnswer = true}) {
                        Image(systemName: "flag")
                            .foregroundColor(.white)
                            .font(.headline)
                            .frame(maxWidth: 100)
                            .frame(height: 44)
                            .background(Color.red)
                            .cornerRadius(8)
                            .padding(.horizontal)
                            .padding(.top, 16)
                    }
                    .padding(.horizontal)
                    .padding(.bottom, 16)
                    .sheet(isPresented: $showingAnswer, content: {SolutionView(solutions: self.challenge.solutions)})
                    
                }
                
            }
            
            
            
        }.navigationTitle(Text(challenge.name))
            .toolbar {
                ToolbarItemGroup(placement: .primaryAction) {
                    if questionHeight == 100{
                        Button(action: {self.questionHeight = 300}){
                            Image(systemName: "arrow.down")
                        }
                    }
                    else{
                        Button(action: {self.questionHeight = 100}){
                            Image(systemName: "arrow.up")
                        }
                        
                    }
                }}
            .alert(isPresented: $showingAlert) {
                Alert(title: Text(alertTitle), message: Text(alertMessage), dismissButton: .default(Text("OK")))
            }
    }
    
    func checkText() {
        let noSpaces = userText.replacingOccurrences(of: " ", with: "")
        let noBrakes = noSpaces.replacingOccurrences(of: "\n", with: "")
        print(noBrakes)
        for solution in challenge.solutions{
            let solutionNoSpaces = solution.replacingOccurrences(of: " ", with: "")
            if solutionNoSpaces.replacingOccurrences(of: "\n", with: "") == noBrakes{
                alertTitle = "Correct"
                alertMessage = "Your solution is correct!"
                showingAlert = true
                break
            }
            alertTitle = "Wrong"
            alertMessage = "Your solution is not in the solutions list. Try another one or add your solution to Challenges.json"
            showingAlert = true
        }
    }
    
}


struct ChallengeView_Previews: PreviewProvider {
    static var previews: some View {
        let model = ChallengesModel()
        model.loadChallenges()
        return ChallengeView(userText: model.challenges[1].edit, challenge: model.challenges[1])
    }
}
