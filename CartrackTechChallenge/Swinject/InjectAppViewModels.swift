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

        // LoginViewModel
        container.register(ILoginViewModel.self) { _ in
            //let userService = container.resolve(IUserService.self)!
            return LoginViewModel()
        }
    }
}
