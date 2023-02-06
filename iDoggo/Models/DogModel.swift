//
//  DogModel.swift
//  iDoggo
//
//  Created by Arnaud NOMMAY on 05/02/2023.
//
import CoreData
import Foundation

struct DogModel: Hashable {
    let image: String
    
    #if DEBUG
    static let exemple1 = DogModel(image: "https://images.dog.ceo/breeds/bulldog-french/n02108915_5367.jpg")
    static let exemple2 = DogModel(image: "https://images.dog.ceo/breeds/bulldog-french/n02108915_5813.jpg")
    static let exemple3 = DogModel(image: "https://images.dog.ceo/breeds/bulldog-french/n02108915_6521.jpg")
    #endif

}

extension Dog {
    static func from(dogModel: DogModel, in context: NSManagedObjectContext){
        let dog = Dog(context: context)
        dog.image = dogModel.image
    }

    func toDogModel() -> DogModel {
        return DogModel(image: self.image!)
    }
}
