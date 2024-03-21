//
//  LoginViewModel.swift
//  SigningFlow
//
//  Created by raiaan on 20/03/2024.
//

import Foundation
protocol LoginViewModelType{
    func sendOTPcode(phone:String,success:(()->()))
}
class LoginViewModel: LoginViewModelType{
    func sendOTPcode(phone:String,success:(()->())){
        success()
    }
}
