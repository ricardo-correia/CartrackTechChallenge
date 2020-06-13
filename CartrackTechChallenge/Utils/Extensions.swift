//
//  Extensions.swift
//  CartrackTechChallenge
//
//  Created by Ricardo Correia on 13/06/2020.
//  Copyright © 2020 Ricardo Correia. All rights reserved.
//

import Foundation

extension String {
    func localized() -> String {
        return NSLocalizedString(self, tableName: nil, bundle: Bundle.main, value: "", comment: "")
    }
}
