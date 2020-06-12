//
//  IRegisterViewModel.swift
//  CartrackTechChallenge
//
//  Created by Ricardo Correia on 09/06/2020.
//  Copyright © 2020 Ricardo Correia. All rights reserved.
//

import Foundation
import RxSwift

internal protocol IRegisterViewModel {
    // MARK: - Functions
    func register(username: String?, password: String?, countryId: Int?) -> Bool
}
