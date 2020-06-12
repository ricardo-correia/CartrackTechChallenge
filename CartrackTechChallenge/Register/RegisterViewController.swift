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

internal class RegisterViewController: BaseViewController, PickerViewDelegate, UITextFieldDelegate {
    
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
        self.setupButton(to: false)
        
        username.delegate = self
        username.addTarget(self, action: #selector(textFieldDidChange), for: .editingChanged)
               
        password.delegate = self
        password.addTarget(self, action: #selector(textFieldDidChange), for: .editingChanged)
    }
    
    func setupButton(to state: Bool) {
        // Checks for the ok button's current state and updates it accordingly
        registerButton.alpha = state ? 1.0 : 0.25
        registerButton.isEnabled = state
    }
    
    @objc func textFieldDidChange() {
        self.validateData()
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
        let title = self.registerViewModel?.getCountry(countryId: countryId)
        self.countryButton.setTitle(title, for: .normal)
        self.selectedCountryId = countryId
        self.validateData()
    }
    
    @IBAction func didPressRegisterButton(_ sender: Any) {
        guard let viewModel = self.registerViewModel else { return }
    
        if viewModel.register(username: username.text, password: password.text, countryId: selectedCountryId) {
            self.presentSuccessAlertController()
        } else {
            self.presentErrorAlertController()
        }
    }
    
    private func validateData() {
        if username.text != "" && password.text != "" && selectedCountryId != nil {
            self.setupButton(to: true)
        } else {
            self.setupButton(to: false)
        }
    }
    
    private func presentSuccessAlertController() {
        let alert = UIAlertController(title: "Registration successfull", message: "Welcome!!", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Ok", style: .cancel, handler: { _ in
            self.navigationController?.popViewController(animated: true)
        }))
        self.present(alert, animated: true)
    }
    
    private func presentErrorAlertController() {
        let alert = UIAlertController(title: "Registration Failed", message: "An error has occurred", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Ok", style: .cancel, handler: nil))
        self.present(alert, animated: true)
    }
}
