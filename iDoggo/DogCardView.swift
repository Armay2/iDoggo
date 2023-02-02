//
//  PictureCard.swift
//  iDoggo
//
//  Created by Arnaud NOMMAY on 02/02/2023.
//

import SwiftUI

struct DogCardView: View {
    let dogCard: DogCard
    var removal: (() -> Void)? = nil
    @State private var offset = CGSize.zero

    var body: some View {
        AsyncImage(
            url: URL(string: dogCard.image)!,
            transaction: Transaction(animation: .easeInOut)
        ) { phase in
            switch phase {
            case .empty:
                Rectangle().foregroundColor(.gray)
            case .success(let image):
                image
                    .resizable()
                    .aspectRatio(contentMode: .fit)
            case .failure:
                Rectangle().foregroundColor(.red)
            @unknown default:
                EmptyView()
            }
        }
        .cornerRadius(9)
        .shadow(radius: 5)
        .frame(height: UIScreen.main.bounds.height * 0.5)
        .padding()
        .rotationEffect(.degrees(Double(offset.width / 10)))
        .offset(x: offset.width * 5, y: 0)
        .opacity(2 - Double(abs(offset.width / 20)))
        .gesture(
            DragGesture()
                .onChanged { gesture in
                    offset = gesture.translation
                }
                .onEnded { _ in
                    if abs(offset.width) > 10 {
                        removal?()
                    } else {
                        offset = .zero
                    }
                }
        )
    }
}

struct DogCardView_Previews: PreviewProvider {
    static var previews: some View {
        DogCardView(dogCard: DogCard(image: "https://images.dog.ceo/breeds/bulldog-french/n02108915_5367.jpg"))
    }
}
