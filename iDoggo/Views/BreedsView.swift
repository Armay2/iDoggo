//
//  ContentView.swift
//  iDoggo
//
//  Created by Arnaud NOMMAY on 01/02/2023.
//

import SwiftUI

struct BreedsView: View {
    @State var breeds = [BreedModel]()
    @State private var searchText = ""
    @State var filteredBreeds = [BreedModel]()

    var body: some View {
        NavigationStack {
            List(filteredBreeds, id: \.title, children: \.subBreeds) { breed in
                NavigationLink(value: breed) {
                    Text(breed.title.capitalized)
                }
            }
            .navigationDestination(for: BreedModel.self, destination: { breed in
                BreedDetails(breed: breed)
            })
            .navigationTitle("Breeds")
        }
        .searchable(text: $searchText)
        .onChange(of: searchText, perform: { newValue in
            search()
        })
        .task {
            breeds = await APIServices.shared.getAllBreeds() ?? []
            filteredBreeds = breeds
        }
    }
    
    private func search() {
        if searchText.isEmpty {
            filteredBreeds = breeds
        } else {
            print("search")
            filteredBreeds = breeds.filter { $0.title.localizedCaseInsensitiveContains(searchText) }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        BreedsView(breeds: [BreedModel.exemple1, BreedModel.exemple2])
    }
}
