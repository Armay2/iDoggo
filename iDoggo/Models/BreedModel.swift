//
//  BreedModel.swift
//  iDoggo
//
//  Created by Arnaud NOMMAY on 05/02/2023.
//

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
