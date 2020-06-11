//
//  RegisterViewModel.swift
//  CartrackTechChallenge
//
//  Created by Ricardo Correia on 09/06/2020.
//  Copyright © 2020 Ricardo Correia. All rights reserved.
//

import Foundation

internal class RegisterViewModel: IRegisterViewModel {
    
    // MARK: - Internal Attributes
    internal var accountService: IAccountService?
         
    
    // MARK: - Default constructor
    init(with accountService: IAccountService?) {
        self.accountService = accountService
    }
    
    internal func getCountryList() -> [Country] {
        return self.accountService?.getCountryList() ?? []
    }
}
