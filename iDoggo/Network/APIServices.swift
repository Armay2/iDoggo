//
//  APIServices.swift
//  iDoggo
//
//  Created by Arnaud NOMMAY on 05/02/2023.
//

import Foundation

class APIServices {
    // MARK: - Singleton
    
    public static let shared = APIServices()
    
    static let baseURL = "https://dog.ceo/api"
    
    //MARK: Endpoints
    enum Endpoints {
        case login

        
        var stringValue: String {
            switch self {
            case .login:
                return "/"
            }
            
        }
        
        var url: URL {
            return URL(string: baseURL + stringValue)!
        }
    }
}
