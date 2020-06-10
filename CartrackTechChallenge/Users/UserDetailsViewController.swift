//
//  UserDetailsViewController.swift
//  CartrackTechChallenge
//
//  Created by Ricardo Correia on 09/06/2020.
//  Copyright © 2020 Ricardo Correia. All rights reserved.
//

import Foundation
import UIKit

internal class UserDetailsViewController: UITableViewController {
    
    // MARK: - Internal Attributes
    internal var userDetailsViewModel: IUserDetailsViewModel?
    internal var userDetails: User?
    
    // MARK: - View Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
}

// MARK: - TableView delegate and datasource functions
extension UserDetailsViewController {
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch indexPath.row {
        case 0:
            return 350
        case 1:
            return 150
        case 2:
            return 350
        default:
            break
        }
        
        return 0
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.row {
        case 0:
            return self.buildMainCell(indexPath)
        case 1:
            return self.buildCompanyCell(indexPath)
        case 2:
            return self.buildAddressCell(indexPath)
        default:
            break
        }
        
        return UITableViewCell()
    }
    
    private func buildMainCell(_ indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "UserDetailsMainCell", for: indexPath) as? UserDetailsMainCell else {
            return UITableViewCell()
        }
            
        /// Configure the cell and supply the data do be displayed
        cell.name?.text = userDetails?.name ?? ""
        cell.username?.text = userDetails?.username ?? ""
        cell.phoneNumber?.text = userDetails?.phone ?? ""
        
        cell.email?.text = userDetails?.email ?? ""
        cell.website?.text = userDetails?.website ?? ""
        
        return cell
    }
    
    private func buildCompanyCell(_ indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "CompanyCell", for: indexPath) as? CompanyCell else {
            return UITableViewCell()
        }
            
        /// Configure the cell and supply the data do be displayed
        cell.companyName?.text = userDetails?.company?.name ?? ""
        cell.catchPhrase?.text = userDetails?.company?.catchPhrase ?? ""
        cell.bs?.text = userDetails?.company?.bs ?? ""
        
        return cell
    }
    
    private func buildAddressCell(_ indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "AddressCell", for: indexPath) as? AddressCell else {
            return UITableViewCell()
        }
            
        /// Configure the cell and supply the data do be displayed
        let address = "\(userDetails?.address?.street ?? ""), \(userDetails?.address?.suite ?? ""), \(userDetails?.address?.zipcode ?? "") - \(userDetails?.address?.city ?? "")"
        cell.addressName?.text = address
        
        return cell
    }
}
