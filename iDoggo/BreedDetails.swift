//
//  BreedDetails.swift
//  iDoggo
//
//  Created by Arnaud NOMMAY on 01/02/2023.
//

import SwiftUI

struct DogCard {
    let image: String
    
    static let exemple1 = DogCard(image: "https://images.dog.ceo/breeds/bulldog-french/n02108915_5367.jpg")
    static let exemple2 = DogCard(image: "https://images.dog.ceo/breeds/bulldog-french/n02108915_5813.jpg")
    static let exemple3 = DogCard(image: "https://images.dog.ceo/breeds/bulldog-french/n02108915_6521.jpg")
}

struct BreedDetails: View {
    var breed: Breed
    @State var dogCards: [DogCard] = [DogCard.exemple1, DogCard.exemple2]

    var body: some View {
        VStack() {
            ZStack() {
                ForEach(0..<dogCards.count, id: \.self) { index in
                    DogCardView(dogCard: dogCards[index]) {
                       withAnimation {
                           removeCard(at: index)
                       }
                    }
                }
            }
        }.navigationTitle("\(breed.title)")
    }
    
    func removeCard(at index: Int) {
        dogCards.remove(at: index)
        self.addCard()
    }
    
    func addCard() {
        dogCards.append(DogCard.exemple3)
    }
}

struct BreedDetails_Previews: PreviewProvider {
    static var previews: some View {
        BreedDetails(breed: Breed.exemple1)
    }
}
