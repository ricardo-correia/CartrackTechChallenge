//
//  InjectAppViewModels.swift
//  Turbu
//
//  Created by Ricardo Correia on 09/06/2020.
//  Copyright © 2020 Ricardo Correia. All rights reserved.
//

import Swinject

public class InjectAppViewModels: Assembly {
    public func assemble(container: Container) {

        // ILoginViewModel
        container.register(ILoginViewModel.self) { _ in
            return LoginViewModel()
        }
        
        // IRegisterViewModel
        container.register(IRegisterViewModel.self) { _ in
            return RegisterViewModel()
        }
        
        // IUserListViewModel
        container.register(IUserListViewModel.self) { _ in
            let userService = container.resolve(IUserService.self)
            return UserListViewModel(with: userService)
        }
        
        // IUserDetailsViewModel
        container.register(IUserDetailsViewModel.self) { _ in
            return UserDetailsViewModel()
        }
    }
}
