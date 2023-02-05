//
//  BreedsResponse.swift
//  iDoggo
//
//  Created by Arnaud NOMMAY on 05/02/2023.
//

import Foundation

struct BreedsResponse: Codable, Hashable {
    let status: String?
    let message: [String: [String]]?
}
