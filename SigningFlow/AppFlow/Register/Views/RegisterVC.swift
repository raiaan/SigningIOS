//
//  RegisterVC.swift
//  SigningFlow
//
//  Created by raiaan on 21/03/2024.
//

import UIKit

class RegisterVC: UIViewController {
    @IBOutlet weak var passwordTF: UITextField!
    @IBOutlet weak var emailTF: UITextField!
    @IBOutlet weak var firstNameTF: UITextField!
    @IBOutlet weak var lastNameTF: UITextField!
    var phoneNumber:String?
    var viewModel:RegisterViewModelType = RegisterViewModel()
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "register"
    }

    @IBAction func regiterAction(_ sender: Any) {
        guard validateInput() else{
            return
        }
        viewModel.saveRegister {[weak self] in
            guard let self else{return}
            let vc = HomeVC()
            vc.user = UserModel(firstName: firstNameTF.text ?? "", lastName: lastNameTF.text ?? "", email: emailTF.text ?? "", password: passwordTF.text ?? "", phone: phoneNumber ?? "")
            navigationController?.pushViewController(vc, animated: true)
        }
    }
    private func validateInput()->Bool{
        guard let firstName = firstNameTF.text , !firstName.isEmpty else{
            swiftMessage(title: "required data", body: "please enter your first name", color: .error, layout: .cardView, style: .top)
            return false
        }
        guard let lastName = lastNameTF.text, !lastName.isEmpty else{
            swiftMessage(title: "required data", body: "please enter your last name", color: .error, layout: .cardView, style: .top)
            return false
        }
        guard let email = emailTF.text, !email.isEmpty else{
            swiftMessage(title: "required data", body: "please enter your email", color: .error, layout: .cardView, style: .top)
            return false
        }
        guard let password = passwordTF.text, !password.isEmpty else{
            swiftMessage(title: "required data", body: "please enter password", color: .error, layout: .cardView, style: .top)
            return false
        }
        guard password.count >= 6 else{
            swiftMessage(title: "not valid data", body: "your password should be greater than 6 charachter", color: .error, layout: .cardView, style: .top)
            return false
        }
        return true
    }
}
