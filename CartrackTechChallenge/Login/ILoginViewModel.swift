//
//  ILoginViewModel.swift
//  CartrackTechChallenge
//
//  Created by Ricardo Correia on 09/06/2020.
//  Copyright © 2020 Ricardo Correia. All rights reserved.
//

import Foundation

internal protocol ILoginViewModel {
    func login(username: String, password: String) -> Bool
}
