//
//  APIServices.swift
//  iDoggo
//
//  Created by Arnaud NOMMAY on 05/02/2023.
//

import Foundation
import Alamofire
import OSLog

class APIServices {
    
    // MARK: - Singleton
    public static let shared = APIServices()
    
    static let baseURL = "https://dog.ceo/api"
    
    //MARK: Endpoints
    enum Endpoints {
        case getAllBreeds
        case getImagesOfBreed(breed: String)
        case getImagesOfSubBreed(breed: String, subBreed: String)
        
        var stringValue: String {
            switch self {
            case .getAllBreeds:
                return "/breeds/list/all"
            case .getImagesOfBreed(let breed):
                return "/breed/\(breed)/images"
            case .getImagesOfSubBreed(let breed, let subBreed):
                return "/breed/\(breed)/\(subBreed)/images"
            }
            
        }
        
        var url: URL {
            return URL(string: baseURL + stringValue)!
        }
    }
    
    //MARK: Methodes

    func getAllBreeds() async -> [BreedModel]? {
        let endpoint = Endpoints.getAllBreeds
        
        return try? await withCheckedThrowingContinuation { continuation in
            AF.request(endpoint.url, method: .get)
                .responseDecodable(of: BreedsResponse.self) { response in
                    switch response.result {
                    case .success(let breedsResponse):
                        os_log("GetAllBreeds success", log: .default, type: .info)
                        
                        var breeds = [BreedModel]()
                        if let message = breedsResponse.message {
                            for (title, subBreedTitles) in message {
                                let subBreeds = subBreedTitles.map { BreedModel(title: $0, isMain: false, mainBreed: "title", subBreeds: nil) }
                                breeds.append(BreedModel(title: title, isMain: true, mainBreed: title, subBreeds: subBreeds.isEmpty ? nil : subBreeds))
                            }
                        }
                        
                        continuation.resume(returning: breeds)
                    case .failure(let error):
                        if let statusCode = response.response?.statusCode {
                            if statusCode >= 500 {
                                os_log("GetAllBreeds failed: Server error %d", log: .default, type: .error, statusCode)
                            } else {
                                os_log("GetAllBreeds failed: %@", log: .default, type: .error, error.localizedDescription)
                            }
                        } else {
                            os_log("GetAllBreeds failed: No response", log: .default, type: .error)
                        }
                        continuation.resume(throwing: error)
                    }
                }
        }
        
    }
    
    func getImagesOfBreed(breed: String) async -> [DogModel]? {
        let endpoint = Endpoints.getImagesOfBreed(breed: breed)
        
        return try? await withCheckedThrowingContinuation { continuation in
            AF.request(endpoint.url, method: .get)
                .responseDecodable(of: ImageResponse.self) { response in
                    switch response.result {
                    case .success(let imageResponse):
                        os_log("GetImagesOfBreed success", log: .default, type: .info)

                        var dogs = [DogModel]()
                        if let images = imageResponse.message {
                            images.forEach { image in
                                dogs.append(DogModel(image: image))
                            }
                        }
                        
                        continuation.resume(returning: dogs)
                    case .failure(let error):
                        if let statusCode = response.response?.statusCode {
                            if statusCode >= 500 {
                                os_log("GetAllBreeds failed: Server error %d", log: .default, type: .error, statusCode)
                            } else {
                                os_log("GetAllBreeds failed: %@", log: .default, type: .error, error.localizedDescription)
                            }
                        } else {
                            os_log("GetAllBreeds failed: No response", log: .default, type: .error)
                        }
                        continuation.resume(throwing: error)
                    }
                }
        }
    }
    
    func getImagesOfSubBreed(breed: String, subBreed: String) async -> [DogModel]? {
        let endpoint = Endpoints.getImagesOfSubBreed(breed: breed, subBreed: subBreed)
        
        return try? await withCheckedThrowingContinuation { continuation in
            AF.request(endpoint.url, method: .get)
                .responseDecodable(of: ImageResponse.self) { response in
                    switch response.result {
                    case .success(let imageResponse):
                        os_log("GetImagesOfBreed success", log: .default, type: .info)

                        var dogs = [DogModel]()
                        if let images = imageResponse.message {
                            images.forEach { image in
                                dogs.append(DogModel(image: image))
                            }
                        }
                        
                        continuation.resume(returning: dogs)
                    case .failure(let error):
                        if let statusCode = response.response?.statusCode {
                            if statusCode >= 500 {
                                os_log("GetAllBreeds failed: Server error %d", log: .default, type: .error, statusCode)
                            } else {
                                os_log("GetAllBreeds failed: %@", log: .default, type: .error, error.localizedDescription)
                            }
                        } else {
                            os_log("GetAllBreeds failed: No response", log: .default, type: .error)
                        }
                        continuation.resume(throwing: error)
                    }
                }
        }
    }
    
    
}
