//
//  MainViewController.swift
//  HomeWorkProject_2.3
//
//  Created by Максим on 13.07.2021.
//

import UIKit

class LoginViewController: UIViewController {
    
    @IBOutlet weak var loginTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    let login = "Max"
    let password = "123456"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let welcomeViewController =
                segue.destination as? WelcomeViewController else { return }
        guard let loginField = loginTextField.text else { return }
        guard let passwordField = passwordTextField.text else { return }
        
        if loginField == login && passwordField == password {
            welcomeViewController.label = "Welcome, \(login)! \n \n 🙋🏼‍♂️"
        } else {
            showAlert(title: "Alarm!", massage: "Enter correct User Name or Password")
        }
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
    }
    
    @IBAction func unwind(for segue: UIStoryboardSegue) {
        guard let _ =
                segue.source as? WelcomeViewController else { return }
        loginTextField.text = nil
        passwordTextField.text = nil
    }
    
    @IBAction func loginAction() {
        showAlert(title: "Reminder!", massage: "Your user name is \(login)")
    }
    @IBAction func passwordAction() {
        showAlert(title: "Reminder!", massage: "Your password is \(password)")
    }
    
}

extension LoginViewController {
    private func showAlert(title: String, massage: String) {
        let alert = UIAlertController(title: title, message: massage, preferredStyle: .alert)
        let alertAction = UIAlertAction(title: "OK", style: .cancel)
        
        alert.addAction(alertAction)
        
        present(alert, animated: true)

        passwordTextField.text = nil
    }
}
