//
//  WelcomeViewController.swift
//  HomeWorkProject_2.3
//
//  Created by Максим on 13.07.2021.
//

import UIKit

class WelcomeViewController: UIViewController {

    @IBOutlet weak var welcomeLabel: UILabel!
    
    var label: String?
    let loginViewController = LoginViewController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        welcomeLabel.text = label
    }

    @IBAction func logOutAction() {
        dismiss(animated: true)
    }
}
