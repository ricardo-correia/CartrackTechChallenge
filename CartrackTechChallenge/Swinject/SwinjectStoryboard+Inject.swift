//
//  SwinjectStoryboard+Inject.swift
//  Turbu
//
//  Created by Ricardo Correia on 09/06/2020.
//  Copyright © 2020 Ricardo Correia. All rights reserved.
//

import Swinject
import SwinjectStoryboard

extension SwinjectStoryboard {
    class func setup() {
        
        // LoginViewController
        defaultContainer.storyboardInitCompleted(LoginViewController.self) { r, c in
            c.loginViewModel = r.resolve(ILoginViewModel.self)
        }
        
        // RegisterViewController
        defaultContainer.storyboardInitCompleted(RegisterViewController.self) { r, c in
            c.registerViewModel = r.resolve(IRegisterViewModel.self)
        }
        
        // UserListViewController
        defaultContainer.storyboardInitCompleted(UserListViewController.self) { r, c in
            c.userListViewModel = r.resolve(IUserListViewModel.self)
        }
        
        // UserDetailsViewController
        defaultContainer.storyboardInitCompleted(UserDetailsViewController.self) { r, c in
            c.userDetailsViewModel = r.resolve(IUserDetailsViewModel.self)
        }

        InjectAppViewModels.init().assemble(container: defaultContainer)
        InjectAppServices.init().assemble(container: defaultContainer)
        InjectAppRepositories.init().assemble(container: defaultContainer)
    }
}
