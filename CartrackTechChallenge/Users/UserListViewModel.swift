//
//  UserListViewModel.swift
//  CartrackTechChallenge
//
//  Created by Ricardo Correia on 09/06/2020.
//  Copyright © 2020 Ricardo Correia. All rights reserved.
//

import Foundation
import RxSwift
import RxCocoa

internal class UserListViewModel: IUserListViewModel {
    
    // MARK: - Internal Attributes
    internal var userService: IUserService?
       
    // MARK: - Private Attributes
    private let disposeBag = DisposeBag()
       
    // MARK: - Default constructor
    init(with userService: IUserService?) {
        self.userService = userService
    }
    
    internal func loadData() {
        let getUserList = self.userService?.getUserList()
        getUserList?.subscribe(
            onNext: { jsonData in
                
            },
            onError: { error in
               
            }
        ).disposed(by: self.disposeBag)
    }
}
