//
//  ContentView.swift
//  iDoggo
//
//  Created by Arnaud NOMMAY on 01/02/2023.
//

import SwiftUI

struct Breed: Hashable {
    let title: String
    let isMain: Bool
    let mainBreed: String?
    let subBreeds: [Breed]?
    
    static let exemple1 = Breed(title: "bulldog", isMain: true, mainBreed: "bulldog", subBreeds:
                                    [Breed(title: "boston", isMain: false, mainBreed: nil, subBreeds: nil),
                                     Breed(title: "english", isMain: false, mainBreed: nil, subBreeds: nil),
                                     Breed(title: "french", isMain: false, mainBreed: nil, subBreeds: nil)])
    static let exemple2 = Breed(title: "westhighland", isMain: true, mainBreed: "westhighland", subBreeds: nil)
}

struct BreedsView: View {
    @State var breeds = [Breed]()
    
    var body: some View {
        NavigationStack {
            List(breeds, id: \.title, children: \.subBreeds) { breed in
                NavigationLink(value: breed) {
                    Text(breed.title.capitalized)
                }
            }
            .navigationDestination(for: Breed.self, destination: { breed in
                BreedDetails(breed: breed)
            })
            .navigationTitle("Breeds")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        BreedsView(breeds: [Breed.exemple1, Breed.exemple2])
    }
}
