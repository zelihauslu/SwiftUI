//
//  BreedImage.swift
//  CatProject
//
//  Created by Zeliha Uslu on 2.06.2022.
//

import Foundation
/*
 "image": {
   "height": 1445,
   "id": "0XYvRd7oD",
   "url": "https://cdn2.thecatapi.com/images/0XYvRd7oD.jpg",
   "width": 1204
 },
 */

struct BreedImage: Codable {
    let height: Int?
    let id: String?
    let url: String?
    let width: Int?
    
}
