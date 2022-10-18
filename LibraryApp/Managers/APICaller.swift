//
//  APICaller.swift
//  LibraryApp
//
//  Created by Emmanuele Montagna on 16/10/22.
//

import Foundation

struct Constants {
    static let baseURL     = "https://fakestoreapi.com/"
    static let productPath = "products"
    static let baseYtURL   = "https://youtube.googleapis.com/youtube/v3/videos?part=snippet%2CcontentDetails%2Cstatistics&chart=mostPopular&regionCode=IT"
    static let ytKey       = "&key=AIzaSyAb-jcSIdjv9lFOLGQyoaoXPKX7JMlVuBs"
}
enum APIError: Error {
    case failedToGetData
    case failedToParseData
}


class APICaller {
    static let shared = APICaller()
    
    
    
    func getAllProducts(completion: @escaping (Result<ProductsResponse, Error>) -> Void) {
        guard let url = URL(string: "\(Constants.baseURL)\(Constants.productPath)") else {return}
        let task = URLSession.shared.dataTask(with: URLRequest(url: url)) { data, _, error in
            guard let data = data, error == nil else {
                completion(.failure(APIError.failedToGetData))
                return
            }
            do {
                let results = try JSONDecoder().decode(ProductsResponse.self, from: data)
                completion(.success(results))
                
            } catch {
                completion(.failure(APIError.failedToParseData))
            }
        }
        
        task.resume()
    }
    
    
    
    func getAllContryVideoWithAlamo(completion: @escaping (Result<YTResponse, Error>) -> Void){
        guard let url = URL(string: "\(Constants.baseYtURL)\(Constants.ytKey)") else {return}
        print(url.description)
        let task = URLSession.shared.dataTask(with: URLRequest(url:url)) { data, _, error in
            guard let data = data, error == nil else {
                completion(.failure(APIError.failedToGetData))
                return
            }
            do {
                let results = try JSONDecoder().decode(YTResponse.self, from: data)
                completion(.success(results))
                
            } catch {
                print(error)
                completion(.failure(APIError.failedToParseData))
            }
        }
        
        task.resume()
    }
    
}
