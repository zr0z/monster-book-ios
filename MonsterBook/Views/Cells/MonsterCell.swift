//
//  MonsterCell.swift
//  MonsterBook
//
//  Created by Zaidin on 2018-02-22.
//  Copyright © 2018 zr0z. All rights reserved.
//

import UIKit

final class MonsterCell: UITableViewCell {
    @IBOutlet var name: UILabel!
    @IBOutlet var specie: UILabel!
    @IBOutlet var ailments: UILabel!
    @IBOutlet var weakness: UILabel!
}
// MARK: ConfigurableCell
extension MonsterCell: ConfigurableCell {
    typealias T = Monster
    
    func configure(_ item: T, at indexPath: IndexPath) {
        name.text = item.name
        specie.text = item.specie
        ailments.text = item.ailments.map({ $0.capitalized }).joined(separator: ", ")
        weakness.text = item.weakness.map({ $0.capitalized }).joined(separator: ", ")
    }
}
