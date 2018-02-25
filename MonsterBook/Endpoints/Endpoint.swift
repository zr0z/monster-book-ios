//
//  EndPoint.swift
//  MonsterBook
//
//  Created by Zaidin on 2018-02-24.
//  Copyright © 2018 zr0z. All rights reserved.
//

import Foundation

enum Endpoint {
    case monsters

    static var baseURL = URL(string:"https://api.jsonbin.io/b/5a919fb6a121bc097fe720da/1")!

    var request:URLRequest {
        var request: URLRequest

        switch self {
        case .monsters:
            request = URLRequest(url: Endpoint.baseURL)
        }
        // Set headers
        request.setValue("application/json", forHTTPHeaderField: "content-type")

        return request
    }
}
