//
//  ImageResponse.swift
//  iDoggo
//
//  Created by Arnaud NOMMAY on 05/02/2023.
//

import Foundation

struct ImageResponse: Decodable, Hashable {
    let status: String?
    let message: [String]?
}
