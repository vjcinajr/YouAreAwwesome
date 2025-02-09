//
//  ContentView.swift
//  YouAreAwwesome
//
//  Created by VINCENT CINA on 2/7/25.
//

import SwiftUI

struct ContentView: View {
    
    @State private var message = ""
    @State private var imageString = ""
    
    var body: some View {

        
        VStack {
            Spacer()
            Image(systemName: imageString)
                .resizable()
                .scaledToFit()
                .foregroundStyle(.orange)
            Text(message)
                .font(.largeTitle)
                .fontWeight(.ultraLight)
            Spacer()
            Button("Press Me!") {
                let message1 = "You are Awesome!"
                let message2 = "You are Great!"
                let imageString1 = "hand.thumbsup"
                let imageString2 = "sun.max.fill"
                
                message = message == message1 ? message2 : message1
                imageString = message == message2 ? imageString2 : imageString1
            }
            .buttonStyle(.borderedProminent)
            .font(.title2)
            .tint(.orange)
        }
        .padding()
        
    }
}

#Preview {
    ContentView()
}
