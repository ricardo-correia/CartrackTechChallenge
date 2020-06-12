//
//  UserListViewController.swift
//  CartrackTechChallenge
//
//  Created by Ricardo Correia on 09/06/2020.
//  Copyright © 2020 Ricardo Correia. All rights reserved.
//

import Foundation
import UIKit
import RxSwift
import RxCocoa

internal class UserListViewController: UITableViewController {
    
    // MARK: - Internal Attributes
    internal var userListViewModel: IUserListViewModel?
    
    // MARK: - Private Attributes
    private var spinner: UIActivityIndicatorView?
    private var userList: [User] = []
    private let disposeBag = DisposeBag()
    
    // MARK: - View Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.bindObservableVariables()
        self.userListViewModel?.loadData()
        
        spinner = UIActivityIndicatorView(style: .medium)
        spinner?.hidesWhenStopped = true
        spinner?.startAnimating()
        self.tableView.backgroundView = spinner
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let row = self.tableView?.indexPathForSelectedRow?.row ?? 0
        guard let viewController = segue.destination as? UserDetailsViewController else {
            return
        }
        
        viewController.userDetails = self.userList[row]
    }
    
    private func bindObservableVariables() {
        self.userListViewModel?.userList.asObservable()
            .bind { list in
                self.userList = list
                self.tableView.reloadData()
                self.spinner?.stopAnimating()
            }.disposed(by: disposeBag)
    }
}

// MARK: - TableView delegate and datasource functions
extension UserListViewController {
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.userList.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "UserListCell", for: indexPath) as? UserListCell
        
        /// Configure the cell and supply the data do be displayed
        let user = self.userList[indexPath.row]
        cell?.name?.text = user.name ?? ""
        cell?.username?.text = "Username: \(user.username ?? "")"
        cell?.email?.text = "Email: \(user.email ?? "")"
        
        return cell ?? UITableViewCell()
    }
}
