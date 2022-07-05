//
//  ViewController.swift
//  BindingMVVM
//
//  Created by Anupam G on 05/07/22.
//

import UIKit

class ViewController: UIViewController {

    var loginVM = LoginViewModel()
    
    lazy var userNameTextFiled : UITextField = {
        let userNameTextFiled = BindingTextFiled()
        userNameTextFiled.placeholder = "Enter User Name"
        userNameTextFiled.backgroundColor = .lightGray
        userNameTextFiled.borderStyle = .roundedRect
        userNameTextFiled.bind { [weak self] text in
            self?.loginVM.userName.value = text
        }
        return userNameTextFiled
    }()
    
    lazy var passwordTextFiled : UITextField = {
        
        let passwordTextField = BindingTextFiled()
        passwordTextField.isSecureTextEntry = true
        passwordTextField.backgroundColor = .lightGray
        passwordTextField.borderStyle = .roundedRect
        passwordTextField.placeholder = "Enter Password"
        passwordTextField.bind {[weak self] text in
            self?.loginVM.password.value = text
        }
        return passwordTextField
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loginVM.userName.bind {[weak self] text in
            self?.userNameTextFiled.text = text
        }
        
        loginVM.password.bind {[weak self] text in
            self?.passwordTextFiled.text = text
        }
        setupUI()
    }

    
    func setupUI(){
//        let userNameTextFiled = BindingTextFiled()
//        userNameTextFiled.placeholder = "Enter User Name"
//        userNameTextFiled.backgroundColor = .lightGray
//        userNameTextFiled.borderStyle = .roundedRect
//        userNameTextFiled.bind { [weak self] text in
//            self?.loginVM.userName.value = text
//        }
//
//
//        let passwordTextField = BindingTextFiled()
//        passwordTextField.isSecureTextEntry = true
//        passwordTextField.backgroundColor = .lightGray
//        passwordTextField.borderStyle = .roundedRect
//        passwordTextField.placeholder = "Enter Password"
//        passwordTextField.bind {[weak self] text in
//            self?.loginVM.password.value = text
//        }
        
        let loginButton = UIButton()
        loginButton.setTitle("Login", for: .normal)
        loginButton.backgroundColor = .lightGray
        loginButton.addTarget(self, action: #selector(login), for: .touchUpInside)
        
        let fetchLoginButton = UIButton()
        fetchLoginButton.setTitle("Fetch Login Button", for: .normal)
        fetchLoginButton.backgroundColor = .blue
        fetchLoginButton.addTarget(self, action: #selector(fetchLoginInfo), for: .touchUpInside)

        let stackView = UIStackView(arrangedSubviews: [userNameTextFiled,passwordTextFiled,loginButton,fetchLoginButton])
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.spacing = 20
        
        self.view.addSubview(stackView)
        
        stackView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        stackView.centerYAnchor.constraint(equalTo: self.view.centerYAnchor).isActive = true
        stackView.widthAnchor.constraint(equalToConstant: 200).isActive = true
    }
    
    @objc func login(){
        print("UserName \(loginVM.userName)")
        print("Password \(loginVM.password)")
    }
    
    @objc func fetchLoginInfo(){
        DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) { [weak self] in
            self?.loginVM.userName.value = "Marry"
        }
    }

}

