//
//  AccountRepository.swift
//  CartrackTechChallenge
//
//  Created by Ricardo Correia on 11/06/2020.
//  Copyright © 2020 Ricardo Correia. All rights reserved.
//

import Foundation
import SQLite3

internal class AccountRepository: BaseSQLiteRepository, IAccountRepository {
    
    // MARK: Private Attributesa
    private let createAccountTableString = """
                                    CREATE TABLE IF NOT EXISTS Account(
                                    Id INTEGER PRIMARY KEY,
                                    CountryId INTEGET NOT NULL,
                                    Username CHAR(255),
                                    Password CHAR(255));
                                    """
    private let insertAccountString = "INSERT INTO Account (CountryId, Username, Password) VALUES (?, ?, ?);"
    private var db: OpaquePointer?
    
    override init(){
        super.init()
        
        self.db = openDatabase()
        self.createAccountTable()
    }
    
    internal func login(username: String, password: String) -> Bool? {
        return self.validateLoginInfo(username: username, password: password)
    }
    
    internal func register(username: String, password: String, countryId: Int) -> Bool? {
        if usernameExists(username: username) {
            return false
        }
        
        return self.insert(username: username as NSString, password: password as NSString, countryId: Int32(countryId))
    }
    
    private func createAccountTable() {
        var createTableStatement: OpaquePointer?

        if sqlite3_prepare_v2(db, createAccountTableString, -1, &createTableStatement, nil) == SQLITE_OK {
            if sqlite3_step(createTableStatement) == SQLITE_DONE {
                NSLog("\nAccount table created.")
            } else {
                NSLog("\nAccount table is not created.")
            }
        } else {
            NSLog("\nCREATE TABLE statement is not prepared.")
        }

        sqlite3_finalize(createTableStatement)
    }
    
    private func insert(username: NSString, password: NSString, countryId: Int32) -> Bool{
        var insertStatement: OpaquePointer?
        var result = false

        if sqlite3_prepare_v2(db, insertAccountString, -1, &insertStatement, nil) == SQLITE_OK {
            sqlite3_bind_int(insertStatement, 1, countryId)
            sqlite3_bind_text(insertStatement, 2, username.utf8String, -1, nil)
            sqlite3_bind_text(insertStatement, 3, password.utf8String, -1, nil)

            if sqlite3_step(insertStatement) == SQLITE_DONE {
                result = true
            }
        }

        sqlite3_finalize(insertStatement)
        
        return result
    }
    
    private func usernameExists(username: String) -> Bool {
        let queryStatementString = "SELECT * FROM Account WHERE Username='\(username)';"
        var queryStatement: OpaquePointer?
        var result = false

        if sqlite3_prepare_v2(db, queryStatementString, -1, &queryStatement, nil) == SQLITE_OK {
            if sqlite3_step(queryStatement) == SQLITE_ROW {
                result = true
            }
        }

        sqlite3_finalize(queryStatement)
        
        return result
    }
    
    private func validateLoginInfo(username: String, password: String) -> Bool {
        let queryStatementString = "SELECT * FROM Account WHERE Username='\(username)' AND Password = '\(password)';"
        var queryStatement: OpaquePointer?
        var result = false

        if sqlite3_prepare_v2(db, queryStatementString, -1, &queryStatement, nil) == SQLITE_OK {
            if sqlite3_step(queryStatement) == SQLITE_ROW {
                result = true
            }
        }

        sqlite3_finalize(queryStatement)
        
        return result
    }
}
