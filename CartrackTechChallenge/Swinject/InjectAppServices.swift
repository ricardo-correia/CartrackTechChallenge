//
//  InjectAppServices.swift
//  Turbu
//
//  Created by Ricardo Correia on 09/06/2020.
//  Copyright © 2020 Ricardo Correia. All rights reserved.
//

import Swinject

public class InjectAppServices: Assembly {
    public func assemble(container: Container) {

        // IUserService
        container.register(IUserService.self) { _ in
            return UserService()
        }
    }
}
