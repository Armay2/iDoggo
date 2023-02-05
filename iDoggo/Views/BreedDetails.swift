//
//  BreedDetails.swift
//  iDoggo
//
//  Created by Arnaud NOMMAY on 01/02/2023.
//

import SwiftUI

struct BreedDetails: View {
    var breed: BreedModel
    @State var dogs = [DogModel]()
    
    var body: some View {
        ScrollView() {
            ForEach(dogs, id: \.self) { dog in
                DogCardView(dog: dog)
            }
        }.navigationTitle("\(breed.title.capitalized)")
            .task {
                if breed.isMain {
                    print(breed)
                    dogs = await APIServices.shared.getImagesOfBreed(breed: breed.title) ?? []
                    print(dogs)
                } else {
                    print(breed)
                    dogs = await APIServices.shared.getImagesOfSubBreed(breed: breed.mainBreed, subBreed: breed.title) ?? []
                    print(dogs)
                }
            }
    }

}

struct BreedDetails_Previews: PreviewProvider {
    static var previews: some View {
        BreedDetails(breed: BreedModel.exemple1)
    }
}
