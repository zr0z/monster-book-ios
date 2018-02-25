//
//  MonsterCell.swift
//  MonsterBook
//
//  Created by Zaidin on 2018-02-22.
//  Copyright © 2018 zr0z. All rights reserved.
//

import UIKit

fileprivate extension UIImageView {
    convenience init(for status:Status,
            at index:Int,
            contentMode mode: UIViewContentMode = .left) {
        self.init(frame: CGRect(x:0, y:0, width:20, height:20))
        contentMode = mode
        image = status.image
        let priority = UILayoutPriority(rawValue: 251.0 - Float(index))
        setContentHuggingPriority(priority, for: .horizontal)
    }
}

fileprivate extension UILabel {
    convenience init(text: String, color: UIColor, alignment: NSTextAlignment = .left) {
        self.init()
        self.text = text
        self.textColor = color
    }
}

final class MonsterCell: UITableViewCell {
    @IBOutlet var name: UILabel!
    @IBOutlet var specie: UILabel!
    @IBOutlet var habitats: UILabel!
    @IBOutlet var ailments: UIStackView!
    @IBOutlet var weakness: UIStackView!
    
    override func prepareForReuse() {
        ailments.subviews.forEach { $0.removeFromSuperview() }
        weakness.subviews.forEach { $0.removeFromSuperview() }
    }
}
// MARK: ConfigurableCell
extension MonsterCell: ConfigurableCell {
    typealias T = Monster
    
    func configure(_ item: T, at indexPath: IndexPath) {
        name.text = item.name
        specie.text = item.specie
        habitats.text = item.habitatsString
        
        if item.ailments.count > 0 {
            for (index, status) in item.ailments.enumerated() {
                ailments.addArrangedSubview(UIImageView(for: status, at: index))
            }
        } else {
            ailments.addArrangedSubview(UILabel(text: "---", color: #colorLiteral(red: 0.75, green: 0.75, blue: 0.75, alpha: 1)))
        }

        if item.weakness.count > 0 {
            for (index, status) in item.weakness.enumerated() {
                weakness.addArrangedSubview(UIImageView(for: status, at: index, contentMode: .right))
            }
        } else {
            weakness.addArrangedSubview(UILabel(text: "---", color: #colorLiteral(red: 0.75, green: 0.75, blue: 0.75, alpha: 1), alignment: .right))
        }
    }
}
