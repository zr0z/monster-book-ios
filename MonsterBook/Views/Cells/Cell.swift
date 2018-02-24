//
//  Cell.swift
//  MonsterBook
//
//  Created by Zaidin on 2018-02-24.
//  Copyright © 2018 zr0z. All rights reserved.
//

import UIKit

public protocol ReusableCell {
    static var reuseIdentifier: String { get }
}

public extension ReusableCell {
    static var reuseIdentifier: String {
        return String(describing: self)
    }
}

public protocol ConfigurableCell: ReusableCell {
    associatedtype T
    func configure(_ item: T, at indexPath: IndexPath)
}
