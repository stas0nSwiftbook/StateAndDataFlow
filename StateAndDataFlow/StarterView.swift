//
//  StarterView.swift
//  StateAndDataFlow
//
//  Created by Alexey Efimov on 26.01.2022.
//

import SwiftUI

struct StarterView: View {
    @EnvironmentObject private var appStorageManager: AppStorageManager
    
    var body: some View {
        Group {
            if appStorageManager.isRegistered {
                ContentView()
            } else {
                RegisterView()
            }
        }
    }
}

struct StarterView_Previews: PreviewProvider {
    static var previews: some View {
        StarterView()
            .environmentObject(AppStorageManager())
    }
}
