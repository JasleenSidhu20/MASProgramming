//
//  MAS_Programming1App.swift
//  MAS_Programming1
//
//  Created by Jasleen Sidhu on 9/12/23.
//

import SwiftUI

import Firebase

@main
struct MAS_Programming1App: App {
    init () {
        FirebaseApp.configure()
    }
    

    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
