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
    
    // MARK: - Private Constants
    private let MAX_USERS = 100
    
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
        
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Account", style: .plain, target: self,
                                                                 action: #selector(accountTapped))
    }
    
    @objc func accountTapped() {
        
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
                self.handleUserData(list)
            }.disposed(by: disposeBag)
    }
    
    private func handleUserData(_ list: [User]) {
        self.userList = list
        if list.count >= self.MAX_USERS {
            self.tableView.tableFooterView?.isHidden = true
        }
        
        self.tableView.reloadData()
        self.spinner?.stopAnimating()
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
        cell?.selectionStyle = .none
        
        /// Configure the cell and supply the data do be displayed
        let user = self.userList[indexPath.row]
        cell?.name?.text = user.name ?? ""
        
        
        let usernameImg = UIImage(named: "username") ?? UIImage()
        cell?.username?.set(image: usernameImg, with: user.username ?? "")
        
        let emailImg = UIImage(named: "email") ?? UIImage()
        cell?.email?.set(image: emailImg, with: user.email ?? "")
        
        return cell ?? UITableViewCell()
    }
    
    override func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        if indexPath.row == tableView.numberOfRows(inSection: indexPath.section) - 1 && self.userList.count <= MAX_USERS {
            self.userListViewModel?.loadData()
        }
    }
}
