//
//  Monster.swift
//  MonsterBook
//
//  Created by Zaidin on 2018-02-24.
//  Copyright © 2018 zr0z. All rights reserved.
//

import Foundation

struct Monster: Codable {
    let name: String
    let specie: String
    let ailments: [String]
    let weakness: [String]
}
// MARK: CustomStringConvertible
extension Monster: CustomStringConvertible {
    var description: String {
        return "<\(specie): \(name)>"
    }
}
// MARK: Model
extension Monster: Model {
    static var endpoint: Endpoint {
        return .monsters
    }
}
