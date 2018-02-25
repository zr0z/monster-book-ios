//
//  APIManager.swift
//  MonsterBook
//
//  Created by Zaidin on 2018-02-24.
//  Copyright © 2018 zr0z. All rights reserved.
//

import Foundation

protocol DataManager {
    typealias DataBuilder = () throws -> Data
    typealias APIManagerCallback = (DataBuilder) -> Void
    
    func fetch(endpoint:Endpoint, completion block: APIManagerCallback?)
}

struct APIManager: DataManager {
    func fetch(endpoint:Endpoint, completion block: APIManagerCallback?) {
        let task = URLSession.shared.dataTask(with: endpoint.request) { (data, response, error) in
            if let data = data {
                block?({ data })
            } else if let error = error {
                block?({ throw error })
            }
        }
        task.resume()
    }
}
