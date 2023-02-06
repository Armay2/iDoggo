//
//  iDoggoApp.swift
//  iDoggo
//
//  Created by Arnaud NOMMAY on 01/02/2023.
//

import SwiftUI

@main
struct iDoggoApp: App {
    @StateObject private var dataController = DataController()
    
    var body: some Scene {
        WindowGroup {
            BreedsView().environment(\.managedObjectContext, dataController.container.viewContext)
        }
    }
}
