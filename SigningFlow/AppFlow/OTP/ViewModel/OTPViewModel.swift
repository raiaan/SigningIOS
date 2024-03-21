//
//  OTPViewModel.swift
//  SigningFlow
//
//  Created by raiaan on 21/03/2024.
//

import Foundation
protocol OTPViewModelType{
    func checkCode(code:String)->Bool
}
class OTPViewModel: OTPViewModelType{
    func checkCode(code: String) -> Bool {
        return code == "1111"
    }
}
