//
//  BreedDetails.swift
//  iDoggo
//
//  Created by Arnaud NOMMAY on 01/02/2023.
//

import SwiftUI

struct Dog: Hashable {
    let image: String
    
    static let exemple1 = Dog(image: "https://images.dog.ceo/breeds/bulldog-french/n02108915_5367.jpg")
    static let exemple2 = Dog(image: "https://images.dog.ceo/breeds/bulldog-french/n02108915_5813.jpg")
    static let exemple3 = Dog(image: "https://images.dog.ceo/breeds/bulldog-french/n02108915_6521.jpg")
}

struct BreedDetails: View {
    var breed: Breed
    @State var dogs = [Dog]()
    
    var body: some View {
        ScrollView() {
            ForEach(dogs, id: \.self) { dog in
                DogCardView(dog: dog)
            }
        }.navigationTitle("\(breed.title.capitalized)")
            .task {
                print("get dog based in breed")
                await dogs = getRandomDog()
            }
    }
    
    private func getRandomDog() async -> [Dog]  {
        if breed.isMain {
            print("Fetch https://dog.ceo/api/breed/\(breed.mainBreed)//images")
            return [Dog.exemple1, Dog.exemple2, Dog.exemple3]
        } else {
            print("Fetch https://dog.ceo/api/breed/\(breed.mainBreed)/\(breed.title)/images")
            return [Dog.exemple1, Dog.exemple2, Dog.exemple3]
        }
    }
}

struct BreedDetails_Previews: PreviewProvider {
    static var previews: some View {
        BreedDetails(breed: Breed.exemple1)
    }
}
