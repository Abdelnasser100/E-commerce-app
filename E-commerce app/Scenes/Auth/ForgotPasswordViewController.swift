//
//  ForgotPasswordViewController.swift
//  E-commerce app
//
//  Created by Abdelnasser on 21/03/2023.
//

import UIKit

class ForgotPasswordViewController: UIViewController {

    //MARK: - OutLit
    @IBOutlet weak var forgotPasswordLable: UILabel!
    @IBOutlet weak var emailView: UIView!
    @IBOutlet weak var emaliTextField: UITextField!
    @IBOutlet weak var sendBtuOutlet: UIButton!
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        emailView.addLayer()
        sendBtuOutlet.addLayer()

    }
    

    @IBAction func didPressSendBtutton(_ sender: UIButton) {
        
    }


}
