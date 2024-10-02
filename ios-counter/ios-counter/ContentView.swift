//
//  ContentView.swift
//  ios-counter
//
//  Created by Sarah Threewits on 10/1/24.
//

import SwiftUI

struct ContentView: View {
    @State private var text = ""
    
    let todo = ["Scream", "Cry", "Throw-up"]
    var body: some View {
        TextField("label", text: $text)
        
        VStack {
            ForEach(todo, id: \.self) { item in
                Text("Todo: \(item)")
            }
        }
    }
}

#Preview {
    ContentView()
}
