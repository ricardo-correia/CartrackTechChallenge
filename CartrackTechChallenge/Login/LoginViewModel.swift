//
//  LoginViewModel.swift
//  CartrackTechChallenge
//
//  Created by Ricardo Correia on 09/06/2020.
//  Copyright © 2020 Ricardo Correia. All rights reserved.
//

import Foundation

internal class LoginViewModel: ILoginViewModel {
   
    // MARK: - Internal Attributes
    internal var accountService: IAccountService?
         
    // MARK: - Default constructor
    init(with accountService: IAccountService?) {
        self.accountService = accountService
    }
    
    internal func login(username: String, password: String) -> Bool {
        //TODO: Verify if all data is properly filled
        return self.accountService?.login(username: username, password: password) ?? false
    }
}
