//
//  Model.swift
//  MonsterBook
//
//  Created by Zaidin on 2018-02-24.
//  Copyright © 2018 zr0z. All rights reserved.
//

import Foundation

protocol Model: Codable {
    static var endpoint:Endpoint {get}
}
