//
//  LoginVC.swift
//  SigningFlow
//
//  Created by raiaan on 20/03/2024.
//

import UIKit
import SwiftMessages
class LoginVC: UIViewController {
    let viewModel:LoginViewModelType = LoginViewModel()
    @IBOutlet weak var mobilePhoneTF: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "login"
        
    }
    override func viewWillAppear(_ animated: Bool) {
        self.navigationItem.rightBarButtonItems = []
    }
    @IBAction func loginAction(_ sender: Any) {
        guard let phone = mobilePhoneTF.text , !phone.isEmpty else{
            swiftMessage(title: "required data", body: "please enter phone number  to send OTP to your mobile", color: .error, layout: .cardView, style: .top)
            return
        }
        guard  phone.count == 11 else{
            swiftMessage(title: "invalide data", body: "please enter egyption phone number  to send OTP to your mobile", color: .error, layout: .cardView, style: .top)
            return
        }
        viewModel.sendOTPcode(phone: phone) {
            //to navigate to OTP
            let vc = OTPVC()
            vc.phone = phone
            navigationController?.pushViewController(vc, animated: true)
        }
    }
}
