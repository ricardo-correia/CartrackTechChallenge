//
//  RegisterViewModel.swift
//  CartrackTechChallenge
//
//  Created by Ricardo Correia on 09/06/2020.
//  Copyright © 2020 Ricardo Correia. All rights reserved.
//

import Foundation
import RxSwift
import RxCocoa

internal class RegisterViewModel: IRegisterViewModel {
    
    // MARK: - Internal Attributes
    internal var accountService: IAccountService?
         
    // MARK: - Default constructor
    init(with accountService: IAccountService?) {
        self.accountService = accountService
    }
    
    internal func register(username: String?, password: String?, countryId: Int?) -> Bool {
        guard let username = username, let password = password, let countryId = countryId else { return false }
        return self.accountService?.register(username: username, password: password, countryId: countryId) ?? false
    }
}
