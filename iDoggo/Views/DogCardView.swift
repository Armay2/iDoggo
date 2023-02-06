//
//  PictureCard.swift
//  iDoggo
//
//  Created by Arnaud NOMMAY on 02/02/2023.
//

import SwiftUI

struct DogCardView: View {
    let dog: DogModel
    
    var body: some View {
        AsyncImage(url: URL(string: dog.image)) { image in
            image
                .resizable()
                .aspectRatio(contentMode: .fit)
        } placeholder: {
            Rectangle()
                .foregroundColor(.gray)
        }
        .cornerRadius(9)
        .shadow(radius: 20)
        .padding()
    }
}

struct DogCardView_Previews: PreviewProvider {
    static var previews: some View {
        DogCardView(dog: DogModel(image: "https://images.dog.ceo/breeds/bulldog-french/n02108915_5367.jpg"))
    }
}
