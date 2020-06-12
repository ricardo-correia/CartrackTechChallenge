//
//  ViewController.swift
//  CartrackTechChallenge
//
//  Created by Ricardo Correia on 09/06/2020.
//  Copyright © 2020 Ricardo Correia. All rights reserved.
//

import UIKit

class LoginViewController: BaseViewController, UITextFieldDelegate {

    // MARK: - IBOutlets
    @IBOutlet weak var image: UIImageView!
    @IBOutlet weak var loginTitle: UILabel!
    @IBOutlet weak var loginDescription: UILabel!
    @IBOutlet weak var username: UITextField!
    @IBOutlet weak var password: UITextField!
    @IBOutlet weak var loginButton: UIButton!
    
    // MARK: - Internal Attributes
    internal var loginViewModel: ILoginViewModel?
    
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
        loginButton.alpha = state ? 1.0 : 0.25
        loginButton.isEnabled = state
    }
    
    @objc func textFieldDidChange() {
        if username.text != "" && password.text != "" {
            self.setupButton(to: true)
        } else {
            self.setupButton(to: false)
        }
    }
    
    @IBAction func didPressLoginButton(_ sender: Any) {
        if self.loginViewModel?.login(username: username.text ?? "", password: password.text ?? "") == true {
            let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
            let viewController = storyBoard.instantiateViewController(withIdentifier: "UserListNavigationController")
            viewController.modalPresentationStyle = .fullScreen
            self.present(viewController, animated: true, completion: {
                self.navigationController?.popViewController(animated: false)
            })
        }
    }
}

