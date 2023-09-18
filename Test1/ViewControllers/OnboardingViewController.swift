//
//  ViewController.swift
//  Test1
//
//  Created by Prince Yadav on 18/09/23.
//

import UIKit

class OnboardingViewController: UIViewController {
    
    @IBOutlet weak var ImgView: UIImageView!
    
    @IBOutlet weak var LoginBtn: UIButton!
    
    @IBOutlet weak var SignUpBtn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Circular Image
        
        ImgView?.layer.cornerRadius = (ImgView?.frame.size.width ?? 0.0) / 2
        ImgView?.clipsToBounds = true
        ImgView?.layer.borderWidth = 3.0
        ImgView?.layer.borderColor = UIColor.white.cgColor
        
    }


}

