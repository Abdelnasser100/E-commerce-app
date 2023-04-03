//
//  SignUpViewController.swift
//  E-commerce app
//
//  Created by Abdelnasser on 21/03/2023.
//

import UIKit

class SignUpViewController: UIViewController {

    //MARK: - OutLit
    @IBOutlet weak var nameView: UIView!
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var singUpLable: UILabel!
    @IBOutlet weak var emailView: UIView!
    @IBOutlet weak var emaliTextField: UITextField!
    @IBOutlet weak var passwordView: UIView!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var singUpBtuOutlet: UIButton!
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        nameView.addLayer()
        emailView.addLayer()
        passwordView.addLayer()
        singUpBtuOutlet.addLayer()

    }
    

    @IBAction func didPressSingUpBtutton(_ sender: UIButton) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let forgotPasswordViewController = storyboard.instantiateViewController(identifier: "ForgotPasswordViewController")
        navigationController?.pushViewController(forgotPasswordViewController, animated: true)
    
    }
    
    
    @IBAction func didPressHaveAnAccountButton(_ sender: UIButton) {
        
    }


}
