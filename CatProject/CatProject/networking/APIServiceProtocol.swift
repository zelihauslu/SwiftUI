//
//  APIServiceProtocol.swift
//  CatProject
//
//  Created by Zeliha Uslu on 4.06.2022.
//

import Foundation


protocol APIServiceProtocol {
    func fetchBreeds(url: URL?, completion: @escaping(Result<[Breed], APIError>) -> Void)
}
