//
//  Status.swift
//  MonsterBook
//
//  Created by Zaidin on 2018-02-24.
//  Copyright © 2018 zr0z. All rights reserved.
//

import UIKit

protocol CustomImageConvertible {
    var image: UIImage {get}
}

enum Status: String, Codable {
    case fire, water, thunder, ice, dragon, poison, stun, paralysis, sleep, blast, bleed, effluve
}
// MARK: CustomImageConvertible
extension Status: CustomImageConvertible {
    var image: UIImage {
        return UIImage(named: self.rawValue)!
    }
}
