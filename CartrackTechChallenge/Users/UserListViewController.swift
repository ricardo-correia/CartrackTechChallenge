//
//  UserListViewController.swift
//  CartrackTechChallenge
//
//  Created by Ricardo Correia on 09/06/2020.
//  Copyright © 2020 Ricardo Correia. All rights reserved.
//

import Foundation

import UIKit

internal class UserListViewController: UITableViewController {
    
    // MARK: - Internal Attributes
    internal var userListViewModel: IUserListViewModel?
    
    // MARK: - View Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        self.userListViewModel?.loadData()
    }
}
