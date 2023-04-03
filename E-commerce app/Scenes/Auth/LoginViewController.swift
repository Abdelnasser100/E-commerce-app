//
//  LoginViewController.swift
//  E-commerce app
//
//  Created by Abdelnasser on 21/03/2023.
//

import UIKit

class LoginViewController: UIViewController {
    
    
    //MARK: - OutLit
    @IBOutlet weak var loginLable: UILabel!
    @IBOutlet weak var emailView: UIView!
    @IBOutlet weak var emaliTextField: UITextField!
    @IBOutlet weak var passwordView: UIView!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var loginBtuOutlet: UIButton!
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        emailView.addLayer()
        passwordView.addLayer()
        loginBtuOutlet.addLayer()

    }
    

    @IBAction func didPressLoginBtutton(_ sender: UIButton) {
      
        goToTabBar()
      //  present(singupViewController, animated: true)
    }
    
    
    func goToTabBar() {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let tabbar = storyboard.instantiateViewController(identifier: "TabBarController")
        let nvg = UINavigationController(rootViewController: tabbar)
        nvg.modalPresentationStyle = .fullScreen
        present(nvg, animated: true)
    }
    
    func goToSingViewController() {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let singupViewController = storyboard.instantiateViewController(identifier: "SignUpViewController")
        navigationController?.pushViewController(singupViewController, animated: true)
    }
    
    
    @IBAction func didPressForgetPasswordButton(_ sender: UIButton) {
        
    }
    

}
