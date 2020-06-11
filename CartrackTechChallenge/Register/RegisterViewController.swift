//
//  RegisterViewController.swift
//  CartrackTechChallenge
//
//  Created by Ricardo Correia on 09/06/2020.
//  Copyright © 2020 Ricardo Correia. All rights reserved.
//

import UIKit

internal protocol PickerViewDelegate {
    func didSelectCountry(countryId: Int)
}

internal class RegisterViewController: BaseViewController, PickerViewDelegate {
    
    // MARK: - IBOutlets
    @IBOutlet weak var image: UIImageView!
    @IBOutlet weak var registerTitle: UILabel!
    @IBOutlet weak var registerDescription: UILabel!
    @IBOutlet weak var username: UITextField!
    @IBOutlet weak var password: UITextField!
    @IBOutlet weak var countryButton: UIButton!
    
    // MARK: - Internal Attributes
    internal var registerViewModel: IRegisterViewModel?
    
    // MARK: - Private Attributes
    private var selectedCountryId: Int?
    
    // MARK: - View Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let viewController = segue.destination as? CountryPickerViewController else {
            return
        }
       
        let countries = self.registerViewModel?.getCountryList()
        viewController.countries = countries
        viewController.delegate = self
    }
    
    func didSelectCountry(countryId: Int) {
        self.selectedCountryId = countryId
    }
    
    @IBAction func didPressRegisterButton(_ sender: Any) {
        self.registerViewModel?.register(username: username.text, password: password.text, countryId: selectedCountryId)
    }
}
