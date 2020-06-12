//
//  IRegisterViewModel.swift
//  CartrackTechChallenge
//
//  Created by Ricardo Correia on 09/06/2020.
//  Copyright © 2020 Ricardo Correia. All rights reserved.
//

import Foundation

internal protocol IRegisterViewModel {
    func register(username: String?, password: String?, countryId: Int?) -> Bool
    func getCountryList() -> [Country]
    func getCountry(countryId: Int) -> String
}
