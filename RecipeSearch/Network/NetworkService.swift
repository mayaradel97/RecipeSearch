//
//  NetworkService.swift
//  RecipeSearch
//
//  Created by Mayar Adel on 5/26/22.
//

import Alamofire
struct NetworkService {
    func getResponse<T: Codable>(url: String, method: HTTPMethod, parameters: Parameters?,headers: HTTPHeaders?,completion:@escaping (T?)->Void) {
        AF.request(url, method: method, parameters: parameters, encoding: URLEncoding(destination: .queryString),headers: headers)
            .validate()
            .responseDecodable(of:T.self ) { (response) in
                switch response.result
                {
                case .success(let data): completion(data)
                case .failure(_):
                    completion(nil)
                }
            }
    }
}
