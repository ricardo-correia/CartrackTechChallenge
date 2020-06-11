//
//  CountryRepository.swift
//  CartrackTechChallenge
//
//  Created by Ricardo Correia on 11/06/2020.
//  Copyright © 2020 Ricardo Correia. All rights reserved.
//

import Foundation
import SQLite3

internal class CountryRepository: BaseSQLiteRepository, ICountryRepository {
    
    // MARK: Private Attributesa
    private let createCountryTableString = """
                                    CREATE TABLE IF NOT EXISTS Country(
                                    Id INTEGER PRIMARY KEY NOT NULL,
                                    Name CHAR(255));
                                    """
    private let insertCountryString = "INSERT INTO Country (Name) VALUES (?);"
    private var db: OpaquePointer?
    
    override init(){
        super.init()
        
        self.db = openDatabase()
        self.createCountryTable()
        
        if checkIfTableIsEmpty() {
            self.createCountryData()
        }
    }
    
    internal func getCountryList() -> [Country] {
        return self.getCountries()
    }
    
    private func createCountryData() {
        self.insert(name: "Portugal")
        self.insert(name: "Spain")
        self.insert(name: "France")
        self.insert(name: "Netherlands")
        self.insert(name: "England")
        self.insert(name: "Germany")
        self.insert(name: "United States of America")
        self.insert(name: "Brazil")
        self.insert(name: "South Africa")
        self.insert(name: "Japan")
    }
    
    private func createCountryTable() {
        var createTableStatement: OpaquePointer?

        if sqlite3_prepare_v2(db, createCountryTableString, -1, &createTableStatement, nil) == SQLITE_OK {
            if sqlite3_step(createTableStatement) == SQLITE_DONE {
                NSLog("\nCountry table created.")
            } else {
                NSLog("\nCountry table is not created.")
            }
        } else {
            NSLog("\nCountry TABLE statement is not prepared.")
        }

        sqlite3_finalize(createTableStatement)
    }
    
    private func insert(name: NSString){
        var insertStatement: OpaquePointer?

        if sqlite3_prepare_v2(db, insertCountryString, -1, &insertStatement, nil) == SQLITE_OK {
            sqlite3_bind_text(insertStatement, 1, name.utf8String, -1, nil)
            sqlite3_step(insertStatement)
        }

        sqlite3_finalize(insertStatement)
    }
    
    private func getCountries() -> [Country]{
        let queryStatementString = "SELECT * FROM Country;"
        var queryStatement: OpaquePointer?
        var result = [Country]()

        if sqlite3_prepare_v2(db, queryStatementString, -1, &queryStatement, nil) == SQLITE_OK {
            while sqlite3_step(queryStatement) == SQLITE_ROW {
                let id = sqlite3_column_int(queryStatement, 0)

                if let queryResultName = sqlite3_column_text(queryStatement, 1) {
                    let name = String(cString: queryResultName)
                    let country = Country(id: Int(id), name: name)
                    
                    result.append(country)
                }
            }
        }

        sqlite3_finalize(queryStatement)
        
        return result
    }
    
    private func checkIfTableIsEmpty() -> Bool{
        let queryStatementString = "SELECT * FROM Country;"
        var queryStatement: OpaquePointer?
        var isEmpty = false

        if sqlite3_prepare_v2(db, queryStatementString, -1, &queryStatement, nil) == SQLITE_OK {
            if sqlite3_step(queryStatement) != SQLITE_ROW {
                isEmpty = true
            }
        }

        sqlite3_finalize(queryStatement)
        
        return isEmpty
    }
}