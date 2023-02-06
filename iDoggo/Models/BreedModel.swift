//
//  BreedModel.swift
//  iDoggo
//
//  Created by Arnaud NOMMAY on 05/02/2023.
//
import CoreData
import Foundation

struct BreedModel: Hashable {
    let title: String
    let isMain: Bool
    let mainBreed: String
    let subBreeds: [BreedModel]?

    #if DEBUG
    static let exemple1 = BreedModel(title: "bulldog", isMain: true, mainBreed: "bulldog", subBreeds:
                                        [BreedModel(title: "boston", isMain: false, mainBreed: "bulldog", subBreeds: nil),
                                         BreedModel(title: "english", isMain: false, mainBreed: "bulldog", subBreeds: nil),
                                         BreedModel(title: "french", isMain: false, mainBreed: "bulldog", subBreeds: nil)])
    static let exemple2 = BreedModel(title: "westhighland", isMain: true, mainBreed: "westhighland", subBreeds: nil)
    #endif

}

extension Breed {
    static func from(breedModel: BreedModel, in context: NSManagedObjectContext) -> Breed {
        let breed = Breed(context: context)
        breed.title = breedModel.title
        breed.isMain = breedModel.isMain
        breed.mainBreed = breedModel.mainBreed

//        if let subBreeds = breedModel.subBreeds {
//            for subBreedModel in subBreeds {
//                let subBreed = Breed.from(breedModel: subBreedModel, in: context)
//                breed.addToSubBreeds(subBreed)
//            }
//        }

        return breed
    }

    func toBreedModel() -> BreedModel {
//        let subBreeds = self.subBreeds?.map { $0.toBreedModel() }
        return BreedModel(title: self.title!, isMain: self.isMain, mainBreed: self.mainBreed!, subBreeds: nil)
    }
}
