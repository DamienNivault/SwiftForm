//
//  ViewController.swift
//  form
//
//  Created by Damien Nivault on 10/10/2018.
//  Copyright © 2018 Damien Nivault. All rights reserved.
//

import UIKit
extension UITextField {
    func setLeftPaddingPoints(_ amount:CGFloat){
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: amount, height: self.frame.size.height))
        self.leftView = paddingView
        self.leftViewMode = .always
    }
    func setRightPaddingPoints(_ amount:CGFloat) {
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: amount, height: self.frame.size.height))
        self.rightView = paddingView
        self.rightViewMode = .always
    }
}
extension UIViewController {
    func hideKeyboardWhenTappedAround() {
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(UIViewController.dismissKeyboard))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }
    
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
}


class ViewController: UIViewController, UITextFieldDelegate {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.blue
        // Do any additional setup after loading the view, typically from a nib.
        
        
        
        self.hideKeyboardWhenTappedAround()
        
        let label = UILabel()
        label.frame = CGRect(x: 24, y: self.view.frame.height - 60, width: self.view.frame.width-48, height: 36)
        label.text = "Golem.ai for the win"
        label.numberOfLines = 2
        label.textAlignment = .center
        label.font.withSize(12)
        label.textColor = UIColor.white
        self.view.addSubview(label)
        
        let button = UIButton()
        button.frame = CGRect(x: 24, y: label.frame.origin.y - 60, width: self.view.frame.width-48, height: 36)
        button.backgroundColor = UIColor.orange
        button.setTitle("Ready to go !", for: .normal)
        button.setTitleColor(UIColor.white, for: .normal)
        button.alpha = 0.7;
        self.view.addSubview(button)
        
        let labelVerifPassword = UITextField()
        labelVerifPassword.frame = CGRect(x: 24, y: button.frame.origin.y-60, width: self.view.frame.width-48, height: 36)
        labelVerifPassword.placeholder = "Password Verification"
        labelVerifPassword.backgroundColor = UIColor.white
        labelVerifPassword.layer.cornerRadius = 5
        labelVerifPassword.alpha = 0.7;
        labelVerifPassword.isSecureTextEntry = true
        labelVerifPassword.setLeftPaddingPoints(15)
        labelVerifPassword.keyboardAppearance = UIKeyboardAppearance.dark;
        labelVerifPassword.returnKeyType = UIReturnKeyType.join
        labelVerifPassword.delegate = self
        labelVerifPassword.tag = 4
        self.view.addSubview(labelVerifPassword)
        
        let labelPassword = UITextField()
        labelPassword.frame = CGRect(x: 24, y: labelVerifPassword.frame.origin.y-60, width: self.view.frame.width-48, height: 36)
        labelPassword.placeholder = "Password"
        labelPassword.backgroundColor = UIColor.white
        labelPassword.layer.cornerRadius = 5
        labelPassword.alpha = 0.7;
        labelPassword.isSecureTextEntry = true
        labelPassword.setLeftPaddingPoints(15)
        labelPassword.keyboardAppearance = UIKeyboardAppearance.dark;
        labelPassword.returnKeyType = UIReturnKeyType.continue
        labelPassword.delegate = self
        labelPassword.tag = 3
        self.view.addSubview(labelPassword)
        
        let labelEmail = UITextField()
        labelEmail.frame = CGRect(x: 24, y: labelPassword.frame.origin.y-60, width: self.view.frame.width-48, height: 36)
        labelEmail.placeholder = "Email"
        labelEmail.backgroundColor = UIColor.white
        labelEmail.layer.cornerRadius = 5
        labelEmail.alpha = 0.7;
        labelEmail.setLeftPaddingPoints(15)
        labelEmail.keyboardAppearance = UIKeyboardAppearance.dark;
        labelEmail.keyboardType = UIKeyboardType.emailAddress
        labelEmail.returnKeyType = UIReturnKeyType.continue
        labelEmail.delegate = self
        labelEmail.tag = 2
        self.view.addSubview(labelEmail)
        
        
        let labelName = UITextField()
        labelName.frame = CGRect(x: 24, y: labelEmail.frame.origin.y-60, width: self.view.frame.width-48, height: 36)
        labelName.placeholder = "Nom"
        labelName.backgroundColor = UIColor.white
        labelName.layer.cornerRadius = 5
        labelName.alpha = 0.7;
        labelName.setLeftPaddingPoints(15)
        labelName.keyboardAppearance = UIKeyboardAppearance.dark;
        labelName.returnKeyType = UIReturnKeyType.continue
        labelName.delegate = self
        labelName.tag = 1
        self.view.addSubview(labelName)
        
        let labelFirstname = UITextField()
        labelFirstname.frame = CGRect(x: 24, y: labelName.frame.origin.y-60, width: self.view.frame.width-48, height: 36)
        labelFirstname.placeholder = "Prénom"
        labelFirstname.backgroundColor = UIColor.white
        labelFirstname.layer.cornerRadius = 5
        labelFirstname.alpha = 0.7;
        labelFirstname.setLeftPaddingPoints(15)
        labelFirstname.keyboardAppearance = UIKeyboardAppearance.dark;
        labelFirstname.returnKeyType = UIReturnKeyType.continue
        labelFirstname.delegate = self
        labelFirstname.tag = 0
        self.view.addSubview(labelFirstname)
        
        UIGraphicsBeginImageContext(self.view.frame.size)
        UIImage(named: "background")?.draw(in: self.view.bounds)
        let image: UIImage = UIGraphicsGetImageFromCurrentImageContext()!
        UIGraphicsEndImageContext()
        self.view.backgroundColor = UIColor(patternImage: image)
        
        let logo = UIImage(named: "logo")
        let logoImageView = UIImageView(image: logo)
        logoImageView.frame = CGRect(x: 24, y: labelFirstname.frame.origin.y-325, width: self.view.frame.width-48, height: 300)
        
         self.view.addSubview(logoImageView)
    }
    func textFieldShouldReturn(_ textField: UITextField) -> Bool
    {
        // Try to find next responder
        if let nextField = textField.superview?.viewWithTag(textField.tag + 1) as? UITextField {
            nextField.becomeFirstResponder()
        } else {
            // Not found, so remove keyboard.
            textField.resignFirstResponder()
        }
        // Do not add a line break
        return false
    }
    

    
}

