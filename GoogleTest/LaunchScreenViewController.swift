//
//  LaunchScreenViewController.swift
//  GoogleTest
//
//  Created by Nasir Hasanovic on 11. 6. 2021..
//

import Foundation
import UIKit

class LaunchScreenViewController: UIViewController{
    @IBOutlet weak var emailText: UITextField!
    @IBOutlet weak var passText: UITextField!
    @IBOutlet weak var btn: UIButton!
    @IBOutlet weak var btnBottom: NSLayoutConstraint!
    @IBOutlet weak var labelC: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setScreen()
        keyboardListener()
    }
    
    func setScreen(){
        btn.setTitle("Log in", for: .normal)
        btn.layer.cornerRadius = 8
        labelC.isHidden = true
        
        emailText.layer.cornerRadius = 8
        passText.layer.cornerRadius = 8
        
        
    }
    func keyboardListener(){
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(handle(keyboardShowNotification:)),
                                               name: UIResponder.keyboardDidShowNotification,
                                               object: nil)
        
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(handleHidde(keyboardShowNotification:)),
                                               name: UIResponder.keyboardDidHideNotification,
                                               object: nil)
    }
    
    @objc
    private func handle(keyboardShowNotification notification: Notification) {
        if let userInfo = notification.userInfo,
           let keyboardRectangle = userInfo[UIResponder.keyboardFrameEndUserInfoKey] as? CGRect {
            
                btnBottom.constant =  keyboardRectangle.height + 5
            }
        }
    
    
    @objc
    private func handleHidde(keyboardShowNotification notification: Notification) {
            
        btnBottom.constant =  30
           
        }
    @IBAction func nextTapp(_ sender: Any) {
        if emailText.text == "test@test.com" && passText.text == "Enver001"{
            let svc = UIStoryboard(name: "Main", bundle: nil)
            let vc = svc.instantiateViewController(withIdentifier: "MainVc")
            vc.modalPresentationStyle = .fullScreen
            self.present(vc, animated: true, completion: nil)
            
        } else{
            labelC.isHidden = false
        }
    }
    
    
}
