//
//  IAccountService.swift
//  CartrackTechChallenge
//
//  Created by Ricardo Correia on 11/06/2020.
//  Copyright © 2020 Ricardo Correia. All rights reserved.
//

import Foundation
import RxSwift

internal protocol IAccountService {
    func login(username: String, password: String) -> Bool?
    func register(username: String, password: String, countryId: Int) -> Bool?
    func getCountryList() -> Observable<[Country]>
}
