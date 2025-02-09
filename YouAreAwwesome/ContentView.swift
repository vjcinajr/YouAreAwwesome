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
    @State private var messagesIndex = 0
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
                .multilineTextAlignment(.center)
            Spacer()
            Button("Show Message") {
                let messages = ["You are Great",
                                "You are Awesome!",
                                "Fabulous? That's You!",
                                "You are Amazing!",
                                "You are Superb!",
                                "When the Genius Bar Needs Help, They Call You!",
                                "You are Fantastic!"]
                message = messages[messagesIndex]
                messagesIndex += 1
                if messagesIndex == messages.count {
                    messagesIndex = 0
                }
                imageName = "image\(imageNumber)"
                imageNumber += 1
                if imageNumber > 9 {
                    imageNumber = 0
                }
                
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
