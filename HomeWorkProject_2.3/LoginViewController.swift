//
//  MainViewController.swift
//  HomeWorkProject_2.3
//
//  Created by Максим on 13.07.2021.
//

import UIKit

class LoginViewController: UIViewController, UITextFieldDelegate {
    
    // MARK: IB Outlets
    
    @IBOutlet weak var loginTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var inButton: UIButton!
    @IBOutlet weak var leftButton: UIButton!
    @IBOutlet weak var rightButton: UIButton!
    
    // MARK: Private Properties
    
    private let login = "Maxim"
    private let password = "123"
    
    // MARK: Override methods
    
    override func viewWillLayoutSubviews() {
        loginTextField.font =
            loginTextField.font?.withSize(view.frame.width / 25)
        passwordTextField.font =
            passwordTextField.font?.withSize(view.frame.width / 25)
        inButton.titleLabel?.font =
            inButton.titleLabel?.font.withSize(view.frame.width / 15)
        leftButton.titleLabel?.font =
            leftButton.titleLabel?.font.withSize(view.frame.width / 25)
        rightButton.titleLabel?.font = rightButton.titleLabel?.font.withSize(view.frame.width / 25)
        } // Возможно это лишнее, но я пытался :)
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let welcomeViewController =
                segue.destination as? WelcomeViewController else { return }
        
        welcomeViewController.label = login
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches,with: event)
        view.endEditing(true)
    }
    
    // MARK: IB Actions
    
    @IBAction func joinAction() {
        if loginTextField.text == login && passwordTextField.text == password {
            performSegue(withIdentifier: "segue", sender: nil)
        } else {
            showAlert(title: "Alarm!",
                      massage: "Enter correct User Name or Password",
                      textField: passwordTextField)
        }
    }
    
    @IBAction func loginAlert() {
        showAlert(title: "Reminder!",
                  massage: "Your user name is \(login)",
                  textField: passwordTextField)
    }
    
    @IBAction func passwordAlert() {
        showAlert(title: "Reminder!",
                  massage: "Your password is \(password)",
                  textField: passwordTextField)
    }
    
    @IBAction func unwind(for segue: UIStoryboardSegue) {
        loginTextField.text = ""
        passwordTextField.text = ""
    }
    
    // MARK: Public methods

    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == loginTextField {
            passwordTextField.becomeFirstResponder()
        } else {
            joinAction()
        }
        return true
    }
    
}

// MARK: Extensions

extension LoginViewController {
    private func showAlert(title: String, massage: String, textField: UITextField?) {
        let alert = UIAlertController(title: title,
                                      message: massage,
                                      preferredStyle: .alert)
        let alertAction = UIAlertAction(title: "OK", style: .cancel) { _ in
            textField?.text = ""
        }
        
        alert.addAction(alertAction)
        
        present(alert, animated: true)
    }
}


