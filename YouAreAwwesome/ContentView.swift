//
//  ContentView.swift
//  YouAreAwwesome
//
//  Created by VINCENT CINA on 2/7/25.
//

import SwiftUI

struct ContentView: View {
    
    @State private var message = ""
    @State private var imageName = ""
    @State private var imageNumber = 99
    
    var body: some View {
        
        VStack {
            Spacer()
            Image("image\(imageNumber)")
                .resizable()
                .scaledToFit()
                .clipShape(RoundedRectangle(cornerRadius: 30))
                .shadow(radius: 30)
            Text(message)
                .font(.largeTitle)
                .fontWeight(.heavy)
                .foregroundStyle(.red)
            Spacer()
            Button("Show Message") {
                
                let message0 = "You are Great"
                let message1 = "You are Awesome!"
                
                message = message == message1 ? message0 : message1
//TODO: - Update the imageName variable -
                imageNumber += 1
                if imageNumber > 9 {
                    imageNumber = 0
                }
                print(imageNumber)
            }
            .buttonStyle(.borderedProminent)
            .font(.title2)
        }
        .padding()
        
    }
}

#Preview {
    ContentView()
}
