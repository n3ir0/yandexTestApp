//
//  RestaurantListViewController.swift
//  yandexTestApp
//
//  Created by Evgeny Gabelev on 01/12/2018.
//  Copyright © 2018 Evgeny Gabelev. All rights reserved.
//

import UIKit

class RestaurantListViewController: UIViewController,
                                    UITableViewDelegate,
                                    UITableViewDataSource {
    
    let restaurantListTableViewCellID = "restaurantListTableViewCellID"
    var restaurantList = [Restaurant]()
    
    let restaurantListTableView: UITableView = {
        let tableView = UITableView()
        tableView.backgroundColor = .viewsBackgroundColor
        tableView.showsVerticalScrollIndicator = false
        return tableView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        restaurantListTableView.dataSource = self
        restaurantListTableView.delegate = self
        restaurantListTableView.register(RestaurantListTableViewCell.self, forCellReuseIdentifier: restaurantListTableViewCellID)
        setupView()
    }
    
    func setupView() {
        view.backgroundColor = .viewsBackgroundColor
        view.addSubview(restaurantListTableView)
        restaurantListTableView.pinToEdgesSafely(view: view)
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //return restaurantList.count
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: restaurantListTableViewCellID, for: indexPath) as! RestaurantListTableViewCell
        
        return cell
    }
    
    
    
    
    
}
