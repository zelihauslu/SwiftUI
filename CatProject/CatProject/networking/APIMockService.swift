//
//  APIMockService.swift
//  CatProject
//
//  Created by Zeliha Uslu on 4.06.2022.
//

import Foundation

struct APIMockService: APIServiceProtocol {
    
    var result: Result<[Breed], APIError>
    
    func fetchBreeds(url: URL?, completion: @escaping (Result<[Breed], APIError>) -> Void) {
        completion(result)
    }
    
    
    
    
}
