//
//  ViewController.swift
//  DragCellSwift
//
//  Created by Brian on 2022/1/11.
//

import UIKit

class ViewController: UIViewController {

    var data = ["One", "Two", "Three", "Four", "Five"]
    
    let listView: XHDragCellTableView = {
        let listView = XHDragCellTableView.init(frame: UIScreen.main.bounds, style: .plain)
        listView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        return listView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        listView.delegate = self
        listView.dataSource = self
        listView.cellDragDelegate = self
        view.addSubview(listView)
    }
}

extension ViewController: UITableViewDelegate, UITableViewDataSource, XHDragCellTableViewDelegate {
    func cellDidDrag(_ from: Int, to: Int) {
        let fromModel = data[from]
        data[from] = data[to]
        data[to] = fromModel
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = data[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: false)
        print(indexPath.row)
    }
    
}

