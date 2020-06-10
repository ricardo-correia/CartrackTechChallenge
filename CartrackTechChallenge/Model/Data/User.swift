//
//  User.swift
//  CartrackTechChallenge
//
//  Created by Ricardo Correia on 10/06/2020.
//  Copyright © 2020 Ricardo Correia. All rights reserved.
//

import Foundation
import SwiftyJSON

internal struct User {
    internal var id: Int?
    internal var name: String?
    internal var username: String?
    internal var email: String?
    internal var phone: String?
    internal var website: String?
    internal var address: Address?
    internal var geo: Geo?
    internal var company: Company?
    
    init(data: JSON) {
        self.parseJsonData(data: data)
    }
    
    private func parseJsonData(data: JSON) {
        
    }
}

internal struct Address {
    internal var street: String?
    internal var suite: String?
    internal var city: String?
    internal var zipcode: String?
    
    init(street: String?, suite: String?, city: String?, zipcode: String?) {
        self.street = street
        self.suite = suite
        self.city = city
        self.zipcode = zipcode
    }
}

internal struct Geo {
    internal var latitude: Double?
    internal var longitude: Double?
    
    init(latitude: Double?, longitude: Double?) {
        self.latitude = latitude
        self.longitude = longitude
    }
}

internal struct Company {
    internal var name: String?
    internal var catchPhrase: String?
    internal var bs: String?
    
    init(name: String?, catchPhrase: String?, bs: String?) {
        self.name = name
        self.catchPhrase = catchPhrase
        self.bs = bs
    }
}
