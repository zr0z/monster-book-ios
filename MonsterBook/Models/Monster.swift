//
//  Monster.swift
//  MonsterBook
//
//  Created by Zaidin on 2018-02-24.
//  Copyright © 2018 zr0z. All rights reserved.
//

import Foundation

fileprivate extension Collection where Iterator.Element == String {
    func capitalisedString() -> String {
        return self.map({ $0.capitalized }).joined(separator: ", ")
    }
}

struct Monster: Codable {
    let name: String
    let specie: String
    let habitats: [String]
    let ailments: [Status]
    let weakness: [Status]
    
    var habitatsString: String {
        if habitats.count == 5 {
            return "All biomes"
        } else {
            return habitats.capitalisedString()
        }
    }
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
