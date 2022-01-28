//
//  RegisterView.swift
//  StateAndDataFlow
//
//  Created by Alexey Efimov on 26.01.2022.
//

import SwiftUI

struct RegisterView: View {
    @EnvironmentObject private var appStorageManager: AppStorageManager
    @State private var charCounter = 0
    @State private var textColor = Color.red
    @State private var alertIsShown = false
    @State private var isDisabled = true
    
    var body: some View {
        VStack {
            HStack {
                TextField("Enter your name", text: $appStorageManager.name)
                    .multilineTextAlignment(.center)
                    .onChange(of: appStorageManager.name) { _ in
                        charCounter = appStorageManager.name.count
                        textColor = charCounter > 2 ? .green : .red
                        isDisabled = textColor == .green ? false : true
                    }
                
                Text("\(charCounter)")
                    .foregroundColor(textColor)
            }
            
            Button(action: registerUser) {
                HStack {
                    Image(systemName: "checkmark.circle")
                    Text("OK")
                }
            }
            .disabled(isDisabled)
        }
    }
    
    private func registerUser() {
        if !appStorageManager.name.isEmpty, appStorageManager.name.count > 2 {
            appStorageManager.isRegistered = true
        } else {
            alertIsShown = true
        }
    }
}

struct RegisterView_Previews: PreviewProvider {
    static var previews: some View {
        RegisterView()
    }
}
