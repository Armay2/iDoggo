//
//  BreedDetails.swift
//  iDoggo
//
//  Created by Arnaud NOMMAY on 01/02/2023.
//

import SwiftUI

struct BreedDetails: View {
    @Environment(\.managedObjectContext) var moc
    @FetchRequest(sortDescriptors: []) var dogsCore: FetchedResults<Dog>
    
    var breed: BreedModel
    @State var dogs = [DogModel]()
    
    var body: some View {
        ScrollView() {
            LazyVStack {
                ForEach(dogs, id: \.self) { dog in
                    DogCardView(dog: dog)
                }
            }
        }
        .navigationTitle("\(breed.title.capitalized)")
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
    
    private func handleNoConnection() {
        if dogs.isEmpty {
            //Load breeds from Core Data
            dogs = dogsCore.map { $0.toDogModel() }
        } else {
            dogs.forEach { dog in
                Dog.from(dogModel: dog, in: moc)
                try? moc.save()
            }
        }
    }
    
}

struct BreedDetails_Previews: PreviewProvider {
    static var previews: some View {
        BreedDetails(breed: BreedModel.exemple2)
    }
}
