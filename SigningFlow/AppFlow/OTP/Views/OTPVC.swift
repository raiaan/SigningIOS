//
//  OTPVC.swift
//  SigningFlow
//
//  Created by raiaan on 21/03/2024.
//

import UIKit
import SVPinCodeView

class OTPVC: UIViewController {
    @IBOutlet weak var waitingSeconds: UILabel!
    @IBOutlet weak var otpTF: SVPinCodeView!
    @IBOutlet weak var ResendBTN: UIButton!
    
    var timer: Timer?
    var secondsElapsed = 30
    var viewModel:OTPViewModelType = OTPViewModel()
    var phone:String?
    override func viewDidLoad() {
        super.viewDidLoad()
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(timerFired), userInfo: nil, repeats: true)
    }
    @IBAction func confirmCode(_ sender: Any) {
        guard  !otpTF.code.isEmpty else{
            swiftMessage(title: "required data", body: "please enter verfication code", color: .error, layout: .cardView, style: .top)
            return
        }
        if viewModel.checkCode(code: otpTF.code){
            let vc = RegisterVC()
            vc.phoneNumber = phone
            navigationController?.pushViewController(vc, animated: true)
        }else{
            swiftMessage(title: "wrong data", body: "otp code you entered is not valid", color: .error, layout: .cardView, style: .top)
            return
        }
    }
    @IBAction func resendOTP(_ sender: Any) {
        secondsElapsed = 30
        ResendBTN.isEnabled = false
        waitingSeconds.text = "00:\(secondsElapsed)"
    }
    
    @objc func timerFired() {
        secondsElapsed -= 1
        if secondsElapsed <= 0{
            ResendBTN.isEnabled = true
            secondsElapsed = 0
        }else{
            ResendBTN.isEnabled = false
        }
        waitingSeconds.text = "00:\(secondsElapsed)"
    }
}
