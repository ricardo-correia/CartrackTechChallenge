//
//  ICountryRepository.swift
//  CartrackTechChallenge
//
//  Created by Ricardo Correia on 11/06/2020.
//  Copyright © 2020 Ricardo Correia. All rights reserved.
//

import Foundation

internal protocol ICountryRepository {
    func getCountryList() -> [Country]
}
