//
//  InjectAppRepositories.swift
//  CartrackTechChallenge
//
//  Created by Ricardo Correia on 10/06/2020.
//  Copyright © 2020 Ricardo Correia. All rights reserved.
//

import Foundation

import Swinject

public class InjectAppRepositories: Assembly {
    public func assemble(container: Container) {

        // IUserRepository
        container.register(IUserRepository.self) { _ in
            return UserRepository()
        }
        
        // IAccountRepository
        container.register(IAccountRepository.self) { _ in
            return AccountRepository()
        }
        
        // ICountryRepository
        container.register(ICountryRepository.self) { _ in
            return CountryRepository()
        }
    }
}
