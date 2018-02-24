//
//  ViewController.swift
//  MonsterBook
//
//  Created by Zaidin on 2018-02-24.
//  Copyright © 2018 zr0z. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet var tableView:UITableView!
    private var data: DataSource<MonsterCell, Monster>!
    private var didFinishLoading = false

    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        data = DataSource(for: tableView, withManager: APIManager())
        
        tableView.delegate = self
        
        // Add the Research Comission and let it pulsate while loading the data.
        let imageView = UIImageView(image: #imageLiteral(resourceName: "emblem"))
        imageView.contentMode = .center
        tableView.backgroundView = imageView
        
        UIView.animate(withDuration: 0.5, delay: 0, options: [.curveEaseInOut, .repeat, .autoreverse], animations: {
            imageView.alpha = 0.2
        })
    }
}

// MARK: UITableViewDelegate
extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        // We want to animate the tableView if:
        // 1. we are still loading the initial data
        // 2. the collection is not empty
        // 3. the cell is visible
        guard !didFinishLoading,
            tableView.numberOfRows(inSection: 0) > 0,
            let indexPathsForVisibleRows = tableView.indexPathsForVisibleRows,
            indexPathsForVisibleRows.contains(indexPath),
            let lastVisibleIndexPath = indexPathsForVisibleRows.last else {
                return
        }
        
        if indexPath.row == 0, let view = tableView.backgroundView  {
            // lock user interactions
            tableView.isUserInteractionEnabled = false
            // Remove the pulsating effect on the Emblem, and fade
            view.layer.removeAllAnimations()
            UIView.animate(withDuration: 0.2, delay: 0, options: .curveEaseInOut, animations: {
                view.alpha = 0.02
            })
        }
        
        let delay = TimeInterval(indexPath.row) / 24
        cell.transform = CGAffineTransform(translationX: 10, y: 0)
        cell.alpha = 0
        UIView.animate(withDuration: 0.25, delay: delay, options: .curveEaseInOut, animations: {
            cell.alpha = 1
            cell.transform = CGAffineTransform.identity
        })
        
        if indexPath == lastVisibleIndexPath {
            // unlock user interactions
            tableView.isUserInteractionEnabled = true
            didFinishLoading = true
        }
    }
}
