//
//  EducationalAPPApp.swift
//  EducationalAPP
//
//  Created by Shotiko Klibadze on 24.03.23.
//

import SwiftUI

@main
struct EducationalAPPApp: App {
    
    @StateObject var model = Model()
    
    var body: some Scene {
        WindowGroup {
           ContentView()
                .environmentObject(model)
        }
    }
}
