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
    let subBreeds: [Breed]?
    
    static let exemple1 = Breed(title: "bulldog", isMain: true, subBreeds:
                                    [Breed(title: "boston", isMain: false, subBreeds: nil),
                                     Breed(title: "english", isMain: false, subBreeds: nil),
                                     Breed(title: "french", isMain: false, subBreeds: nil)])
    static let exemple2 = Breed(title: "westhighland", isMain: true, subBreeds: nil)
}

struct BreedsView: View {
    @State var breeds = [Breed]()
    
    var body: some View {
        NavigationStack {
            List(breeds, id: \.title, children: \.subBreeds) { breed in
                NavigationLink(value: breed) {
                    Text(breed.title)
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
