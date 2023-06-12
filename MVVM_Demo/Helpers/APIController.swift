//
//  APIController.swift
//  MVVM_Demo
//
//  Created by Touseef Sarwar on 09/06/2023.
//

import Foundation

typealias handler = (Result<[Product],DataError>) -> Void


final class APIController {
    
    static let shared = APIController()
    
    func fetchData(_ complition: @escaping handler){
        guard let url = URL(string:Constants.API.url) else {
            complition(.failure(.invalidURL))
            return
        }
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data, error == nil else{
                complition(.failure(.invalidDataError))
                return
            }
            
            guard let response = response as? HTTPURLResponse, 200...299 ~= response.statusCode else{
                complition(.failure(.invalidResponse))
                return
            }
            
            do{
                let product = try JSONDecoder().decode([Product].self, from: data)
                complition(.success(product))
            }catch{
                complition(.failure(.error(error)))
            }
            
            
        }.resume()
    }
    
}


enum DataError : Error {
    case invalidDataError
    case invalidResponse
    case invalidURL
    case invalidDecoding
    case error(Error?)
}
