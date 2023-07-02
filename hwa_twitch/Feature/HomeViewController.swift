//
//  HomeViewController.swift
//  hwa_twitch
//
//  Created by Batuhan Benli on 2.07.2023.
//

import UIKit

final class HomeViewController: UIViewController {
    
    private let titleLabel:UILabel = UILabel()
    private let tableView :UITableView = UITableView()
    
    private let items : [User] = [
        .init(name: "Veli", age:30),
        .init(name: "Ahmet", age: 20)
    ]
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        view.backgroundColor = .white
        titleLabel.text = "HWA Discord"
        titleLabel.font = UIFont.boldSystemFont(ofSize: 24)
        
        tableView.dataSource=self
        tableView.delegate=self
        
        view.addSubview(titleLabel)
        view.addSubview(tableView)
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        tableView.translatesAutoresizingMaskIntoConstraints = false
        
        titleLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20).isActive = true
        titleLabel.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        titleLabel.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        
        tableView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 10).isActive = true
        tableView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 20).isActive = true
        tableView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -20).isActive = true
        tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
    }
    

}

// #MARK: - TableView cell
extension HomeViewController: UITableViewDataSource , UITableViewDelegate{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section : Int) -> Int{
        items.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for:indexPath)
        
        cell.textLabel?.text = items[indexPath.row].age.description
        
        return cell
    }
}

struct User{
    let name:String
    let age:Int
}
