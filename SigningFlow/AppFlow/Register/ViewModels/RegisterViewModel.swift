//
//  RegisterViewModel.swift
//  SigningFlow
//
//  Created by raiaan on 21/03/2024.
//

import Foundation
protocol RegisterViewModelType{
    func saveRegister( success:()->())
}
class RegisterViewModel:RegisterViewModelType{
    func saveRegister(success: () -> ()) {
        success()
    }
    
    
}
