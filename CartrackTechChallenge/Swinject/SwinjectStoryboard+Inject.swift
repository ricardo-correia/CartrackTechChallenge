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

        InjectAppViewModels.init().assemble(container: defaultContainer)
        InjectAppServices.init().assemble(container: defaultContainer)
    }
}
