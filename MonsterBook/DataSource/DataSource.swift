//
//  DataSource.swift
//  MonsterBook
//
//  Created by Zaidin on 2018-02-24.
//  Copyright © 2018 zr0z. All rights reserved.
//

import UIKit

final class DataSource<Cell: UITableViewCell, M: Model> : NSObject, UITableViewDataSource
where Cell:ConfigurableCell, Cell.T == M {
    private(set) var collection = [M]()
    private let manager:APIManager
    private weak var tableView:UITableView?
    
    init(for tableView: UITableView, withManager manager: APIManager) {
        self.manager = manager
        self.tableView = tableView
        super.init()
        tableView.dataSource = self
        fetch()
    }
    
    func fetch() {
        manager.fetch(endpoint: M.self.endpoint) { builder in
            let decoder = JSONDecoder()
            
            if let data = try? builder(),
                let collection = try? decoder.decode([String: [M]].self, from: data).first!.value,
                collection.count > 0 {
                self.collection = collection
                DispatchQueue.main.async {
                    self.tableView?.reloadData()
                }
            }
        }
    }
    
    // MARK: UITableViewDataSource
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return collection.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: Cell.reuseIdentifier, for: indexPath) as? Cell else {
            return UITableViewCell()
        }
        cell.configure(collection[indexPath.row], at: indexPath)
        return cell
    }
}
