//
//  WelcomeViewController.swift
//  HomeWorkProject_2.3
//
//  Created by Максим on 13.07.2021.
//

import UIKit

class WelcomeViewController: UIViewController {
    
    // MARK: IB Outlets

    @IBOutlet weak var welcomeLabel: UILabel!
    @IBOutlet weak var outButton: UIButton!
    
    // MARK: Public properties
    
    var label: String?
    
    // MARK: Override methods
    
    override func viewWillLayoutSubviews() {
        welcomeLabel.font = welcomeLabel.font.withSize(view.frame.width / 10)
        outButton.titleLabel?.font = outButton.titleLabel?.font.withSize(view.frame.width / 15)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        guard let label = label else { return }
        welcomeLabel.text = "Welcome, \(label)!"
    }

}
