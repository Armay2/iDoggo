//
//  APIError.swift
//  iDoggo
//
//  Created by Arnaud NOMMAY on 05/02/2023.
//

import Foundation

enum APIError: Error {
    case invalidResponse
    case serverError(code: Int)
    case customError(message: String)
    case otherError
}
