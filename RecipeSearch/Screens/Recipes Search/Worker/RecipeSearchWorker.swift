//
//  RecipeSearchWorker.swift
//  RecipeSearch
//
//  Created by Mayar Adel on 5/27/22.
//

import Foundation
struct RecipeSearchWorker {
    var networkService: NetworkService
    init() {
        networkService = NetworkService()
    }
    func getRescipes(searchText: String,
                     filter: String?, completion: @escaping(RecipeModel?)->Void)  {
        var parameters = ["q": searchText,
                          "app_id": API.app_id.rawValue,
                          "app_key": API.app_keys.rawValue]
        if filter != nil {
            parameters["health"] = filter
        }
        networkService.getResponse(url: API.baseURL.rawValue, method: .get, parameters: parameters, headers: nil, completion: completion)
    }
}
