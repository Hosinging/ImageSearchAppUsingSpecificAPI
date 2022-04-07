//
//  ImageSearchAppUsingSpecificAPIApp.swift
//  ImageSearchAppUsingSpecificAPI
//
//  Created by Theo on 2022/04/07.
//

import SwiftUI

@main
struct ImageSearchAppUsingSpecificAPIApp: App {
    var body: some Scene {
        WindowGroup {
            MainView()
                .environmentObject(ViewModel())
        }
    }
}
