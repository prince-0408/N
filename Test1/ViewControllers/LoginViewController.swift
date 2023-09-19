//
//  LoginViewController.swift
//  Test1
//
//  Created by Prince Yadav on 18/09/23.
//

import UIKit
import FirebaseCore
import FirebaseAuth


class LoginViewController: UIViewController {

    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var PasswordTextField: UITextField!
    
    @IBOutlet weak var ImgView2: UIImageView!
    @IBOutlet weak var GoBtn: UIButton!
    
    var isSignIn : Bool = true
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        //UIImage
        ImgView2?.layer.cornerRadius = (ImgView2?.frame.size.width ?? 0.0) / 2
        ImgView2?.clipsToBounds = true
        ImgView2?.layer.borderWidth = 3.0
        ImgView2?.layer.borderColor = UIColor.white.cgColor
        
    }
    
    
    @IBAction func GoBtnTapped(_ sender: Any) {
        if let email = emailTextField.text, let pass = PasswordTextField.text
        {
            if isSignIn {
                //Login User
                Auth.auth().signIn(withEmail: email, password: pass, completion: { ( user , error)in
                    
                    if let u = user {
                        self.performSegue(withIdentifier: "HomeVC", sender: self)
                    } else {
                        //error will show
                        self.performSegue(withIdentifier: "Onboarding", sender: self)
                    }
                })
                
//            } else {
//                //register
//                Auth.auth().createUser(withEmail: email, password: pass, completion: {(user, error)in
//
//                    if let u = user {
//                        //user is found
//                    }
//                    else {
//                        //error
//                    }
//                })
            }
        }
        
    }
    
}
