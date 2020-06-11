//
//  AccountService.swift
//  CartrackTechChallenge
//
//  Created by Ricardo Correia on 11/06/2020.
//  Copyright © 2020 Ricardo Correia. All rights reserved.
//

import Foundation
import RxSwift

internal class AccountService: IAccountService {
    
    // MARK: - Internal Attributes
    internal var accountRepository: IAccountRepository?
    internal var countryRepository: ICountryRepository?
    
    // MARK: - Private Attributes
    private let disposeBag = DisposeBag()
    
    // MARK: - Default constructor
    init(with accountRepository: IAccountRepository?, countryRepository: ICountryRepository?) {
        self.accountRepository = accountRepository
        self.countryRepository = countryRepository
    }
    
    internal func login(username: String, password: String) {
        self.accountRepository?.login(username: username, password: password)
    }
    
    internal func register(username: String, password: String, countryId: Int) {
        self.accountRepository?.register(username: username, password: password, countryId: countryId)
    }
    
    func getCountryList() -> [Country] {
        return self.countryRepository?.getCountryList() ?? []
    }
}
