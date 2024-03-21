//
//  HomeVC.swift
//  SigningFlow
//
//  Created by raiaan on 21/03/2024.
//

import UIKit

class HomeVC: UIViewController {
    @IBOutlet weak var welcomeLabel: UILabel!
    var user: UserModel?
    override func viewDidLoad() {
        super.viewDidLoad()
        welcomeLabel.text = "Welcome \(user?.firstName ?? "") \(user?.lastName ?? "")"
    }

}
