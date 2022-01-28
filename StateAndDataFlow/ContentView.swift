//
//  ContentView.swift
//  StateAndDataFlow
//
//  Created by Alexey Efimov on 26.01.2022.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject private var appStorageManager: AppStorageManager
    @StateObject private var timer = TimeCounter()
    
    var body: some View {
        VStack {
            TextView(text: "Hi, \(appStorageManager.name)")
            TextView(text: "\(timer.counter)")
            Spacer()
            ButtonView(title: "Start", action: timer.startTimer, background: .red)
            Spacer()
            ButtonView(title: "Logout", action: appStorageManager.clear, background: .blue)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(AppStorageManager())
    }
}

struct ButtonView: View {
    let title: String
    let action: () -> Void
    let background: Color
    
    var body: some View {
        Button(action: action) {
            Text(title)
                .font(.title)
                .fontWeight(.bold)
                .foregroundColor(.white)
        }
        .frame(width: 200, height: 60)
        .background(background)
        .cornerRadius(20)
        .overlay(
            RoundedRectangle(cornerRadius: 20)
                .stroke(Color.black, lineWidth: 4)
        )
    }
}

struct TextView: View {
    let text: String
    
    var body: some View {
        Text(text)
            .font(.largeTitle)
            .padding(.top, 100)
    }
}
