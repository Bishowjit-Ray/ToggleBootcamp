//
//  ContentView.swift
//  TextFieldBootCamp
//
//  Created by Bishowjit Ray on 16/9/22.
//

import SwiftUI

struct ContentView: View {
    @State var textFieldText: String = ""
    @State var dataArray: [String] = []
    var body: some View {
        NavigationView{
            VStack {
                TextField("Type something here", text: $textFieldText)
                    //textFieldStyle(RoundedBorderTextFieldStyle() )
                    .padding()
                    .background(Color.gray.opacity(0.3).cornerRadius(10))
                    .foregroundColor(Color.red)
                    .font(.headline )
                
                Button(action: {
                    if textIsAppropriate() {
                        saveText()
                    }
                    
                }, label: {
                    Text("Save")
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(textIsAppropriate() ? Color.blue: Color.gray
                        )
                        .cornerRadius(10)
                        .foregroundColor(Color.white)
                        .font(.headline )
                })
                .disabled(!textIsAppropriate())
                ForEach(dataArray, id: \.self) { data in
                    Text(data)
                }
                   Spacer()
            }
            .padding()
            .navigationTitle("TextField Bootcamp ")
        }
     
        
    }
    func textIsAppropriate() -> Bool {
        // Check text
        if textFieldText.count >= 3 {
            return true
        }
        return false
    }
    
    func saveText() {
        dataArray.append(textFieldText)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
