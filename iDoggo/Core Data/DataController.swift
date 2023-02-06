//
//  DataController.swift
//  iDoggo
//
//  Created by Arnaud NOMMAY on 06/02/2023.
//

import CoreData
import Foundation

class DataController: ObservableObject {
    let  container = NSPersistentContainer(name: "BreedsDataModel")
    
    init() {
        container.loadPersistentStores { description, error in
            if let error = error {
                print("Core Data failed to load \(error.localizedDescription)")
            }
        }
    }

}
