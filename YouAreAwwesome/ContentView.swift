//
//  ContentView.swift
//  YouAreAwwesome
//
//  Created by VINCENT CINA on 2/7/25.
//

import SwiftUI

struct ContentView: View {
    
    @State private var message = "I Am A Programmer!"
    
    var body: some View {
        
        VStack {
            
            Spacer()
            
            Image(systemName: "swift")
                .resizable()
                .scaledToFit()
                .foregroundStyle(.orange)
                .frame(width: 200, height: 200)
            Text(message)
                .font(.largeTitle)
                .fontWeight(.ultraLight)
            Spacer()
            Spacer()
            HStack {
                Button("Awesome") {
                    message = "Awesome!"
                }
                Button("Breat") {
                    message = "Awesome!"
                }
            }
            .buttonStyle(.borderedProminent)
            .font(.title2)
            
            .fontWeight(.ultraLight)
            .tint(.orange)
        }
        .padding()
        
    }
}

#Preview {
    ContentView()
}
