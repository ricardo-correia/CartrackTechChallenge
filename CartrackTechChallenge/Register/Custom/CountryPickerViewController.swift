//
//  CountryPickerViewController.swift
//  CartrackTechChallenge
//
//  Created by Ricardo Correia on 11/06/2020.
//  Copyright © 2020 Ricardo Correia. All rights reserved.
//

import Foundation
import UIKit

internal class CountryPickerViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource  {
    
    // MARK: IBOutlets
    @IBOutlet weak var pickerView: UIPickerView!
    
    // MARK: Internal Attributes
    internal var delegate: PickerViewDelegate?
    internal var countries: [Country]?
    
    // MARK: - View Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.pickerView.delegate = self
        self.pickerView.dataSource = self
    }
    
    @IBAction func didPressSaveButton(_ sender: Any) {
        let index = pickerView.selectedRow(inComponent: 0)
        self.delegate?.didSelectCountry(countryId: countries?[index].id ?? 0)
        self.dismiss(animated: true)
    }
}

// MARK: - PickerView delegate and datasource
extension CountryPickerViewController {
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return self.countries?.count ?? 0
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return countries?[row].name
    }
}
