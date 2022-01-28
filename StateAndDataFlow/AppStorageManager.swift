//
//  AppStorageService.swift
//  StateAndDataFlow
//
//  Created by Станислав Буйновский on 28.01.2022.
//

import Foundation
import SwiftUI

class AppStorageManager: ObservableObject {
    @AppStorage("name") var name = ""
    @AppStorage("isRegistered") var isRegistered = false
    
    func logout() {
        name = ""
        isRegistered = false
    }
}
