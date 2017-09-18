//
//  LoginController.swift
//  ChatApp
//
//  Created by ATVI_MOCAP on 9/15/17.
//  Copyright © 2017 ATVI_MOCAP. All rights reserved.
//

import UIKit

class LoginController: UIViewController {
    
    let inputsContainerView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.white
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.cornerRadius = 5
        view.layer.masksToBounds = true
        return view
    }()
    
    lazy var loginRegisterButton: UIButton = {
        let button = UIButton(type: .system)
        button.backgroundColor = UIColor(r: 80, g:101, b: 161, a: 1)
        button.setTitleColor(UIColor.white, for: .normal)
        button.setTitle("Register", for: .normal)
        button.layer.cornerRadius = 5
        button.layer.masksToBounds = true
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)
        button.translatesAutoresizingMaskIntoConstraints = false
        
        button.addTarget(self, action: #selector(handleLoginRegisterPressed), for: .touchDown)
        return button
    }()
    
    let nameTextField: UITextField = {
       let field = UITextField()
        field.placeholder = "Name"
        field.translatesAutoresizingMaskIntoConstraints = false
        return field
    }()
    
    let nameSeperatorView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.lightGray
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let emailTextField: UITextField = {
        let field = UITextField()
        field.placeholder = "Email Adress"
        field.translatesAutoresizingMaskIntoConstraints = false
        return field
    }()
    
    let emailSeperatorView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.lightGray
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let passwordTextField: UITextField = {
        let field = UITextField()
        field.placeholder = "Password"
        field.translatesAutoresizingMaskIntoConstraints = false
        field.isSecureTextEntry = true
        return field
    }()
    
    let profileImageView: UIImageView = {
       let view = UIImageView()
        view.image = UIImage(named: "CTX_WhiteOnBlack_01")
        view.contentMode = .scaleAspectFit
        view.translatesAutoresizingMaskIntoConstraints = false
        
        return view
    }()
    
    lazy var loginRegisterSegmentedControl: UISegmentedControl = {
        let control = UISegmentedControl(items: ["Login", "Register"])
        control.tintColor = UIColor.white
        control.translatesAutoresizingMaskIntoConstraints = false
        control.selectedSegmentIndex = 0
        control.addTarget(self, action: #selector(handleLoginRegisterChange), for: .valueChanged)
        return control
    }()
    
    @objc func handleLoginRegisterChange() {
        let index = loginRegisterSegmentedControl.selectedSegmentIndex
        let title = loginRegisterSegmentedControl.titleForSegment(at: index)
        
        loginRegisterButton.setTitle(title, for: .normal)
        var height:CGFloat = 150
        var multiplier:CGFloat = 1/3
        var nameMultiplier:CGFloat = 1/3
        
        switch index {
        case 0:
            height = 100
            multiplier = 1/2
            nameMultiplier = 0
        case 1:
            height = 150
            multiplier = 1/3
            nameMultiplier = 1/3
        default:
            height = 150
            multiplier = 1/3
            nameMultiplier = 1/3
        }
        
        inputsContainerViewHeightAnchor?.constant = height
        
        nameTextFieldHeightAnchor?.isActive = false
        nameTextFieldHeightAnchor = nameTextField.heightAnchor.constraint(equalTo: inputsContainerView.heightAnchor, multiplier: nameMultiplier)
        nameTextFieldHeightAnchor?.isActive = true

        emailTextFieldHeightAnchor?.isActive = false
        emailTextFieldHeightAnchor = emailTextField.heightAnchor.constraint(equalTo: inputsContainerView.heightAnchor, multiplier: multiplier)
        emailTextFieldHeightAnchor?.isActive = true

        passwordTextFieldHeightAnchor?.isActive = false
        passwordTextFieldHeightAnchor = passwordTextField.heightAnchor.constraint(equalTo: inputsContainerView.heightAnchor, multiplier: multiplier)
        passwordTextFieldHeightAnchor?.isActive = true
    }
    
    @objc func handleLoginRegisterPressed() {
        let title = loginRegisterSegmentedControl.titleForSegment(at: loginRegisterSegmentedControl.selectedSegmentIndex)
        
    }
    
    var inputsContainerViewHeightAnchor: NSLayoutConstraint?
    var nameTextFieldHeightAnchor: NSLayoutConstraint?
    var emailTextFieldHeightAnchor: NSLayoutConstraint?
    var passwordTextFieldHeightAnchor: NSLayoutConstraint?
    
    fileprivate func setupInputsContainerView() {
        inputsContainerView.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 0).isActive = true
        inputsContainerView.topAnchor.constraint(equalTo: loginRegisterSegmentedControl.bottomAnchor, constant: 10).isActive = true
        inputsContainerView.widthAnchor.constraint(equalTo: view.widthAnchor, constant: -24).isActive = true
        inputsContainerViewHeightAnchor = inputsContainerView.heightAnchor.constraint(equalToConstant: 150)
            inputsContainerViewHeightAnchor?.isActive = true
        
        inputsContainerView.addSubview(nameTextField)
        inputsContainerView.addSubview(nameSeperatorView)
        inputsContainerView.addSubview(emailTextField)
        inputsContainerView.addSubview(emailSeperatorView)
        inputsContainerView.addSubview(passwordTextField)

        nameTextField.leftAnchor.constraint(equalTo: inputsContainerView.leftAnchor, constant: 12).isActive = true
        nameTextField.topAnchor.constraint(equalTo: inputsContainerView.topAnchor, constant: 0).isActive = true
        nameTextField.widthAnchor.constraint(equalTo: inputsContainerView.widthAnchor, constant: 0).isActive = true
        nameTextFieldHeightAnchor = nameTextField.heightAnchor.constraint(equalTo: inputsContainerView.heightAnchor, multiplier: 1/3)
        nameTextFieldHeightAnchor?.isActive = true
        
        nameSeperatorView.leftAnchor.constraint(equalTo: inputsContainerView.leftAnchor, constant: 5).isActive = true
        nameSeperatorView.topAnchor.constraint(equalTo: nameTextField.bottomAnchor, constant: 0).isActive = true
        nameSeperatorView.widthAnchor.constraint(equalTo: inputsContainerView.widthAnchor, constant: -10).isActive = true
        nameSeperatorView.heightAnchor.constraint(equalToConstant: 1).isActive = true
        
        emailTextField.leftAnchor.constraint(equalTo: inputsContainerView.leftAnchor, constant: 12).isActive = true
        emailTextField.topAnchor.constraint(equalTo: nameSeperatorView.topAnchor, constant: 0).isActive = true
        emailTextField.widthAnchor.constraint(equalTo: inputsContainerView.widthAnchor, constant: 0).isActive = true
        emailTextFieldHeightAnchor = emailTextField.heightAnchor.constraint(equalTo: inputsContainerView.heightAnchor, multiplier: 1/3)
        emailTextFieldHeightAnchor?.isActive = true
        
        emailSeperatorView.leftAnchor.constraint(equalTo: inputsContainerView.leftAnchor, constant: 5).isActive = true
        emailSeperatorView.topAnchor.constraint(equalTo: emailTextField.bottomAnchor, constant: 0).isActive = true
        emailSeperatorView.widthAnchor.constraint(equalTo: inputsContainerView.widthAnchor, constant: -10).isActive = true
        emailSeperatorView.heightAnchor.constraint(equalToConstant: 1).isActive = true
        
        passwordTextField.leftAnchor.constraint(equalTo: inputsContainerView.leftAnchor, constant: 12).isActive = true
        passwordTextField.topAnchor.constraint(equalTo: emailSeperatorView.topAnchor, constant: 0).isActive = true
        passwordTextField.widthAnchor.constraint(equalTo: inputsContainerView.widthAnchor, constant: 0).isActive = true
        passwordTextFieldHeightAnchor = passwordTextField.heightAnchor.constraint(equalTo: inputsContainerView.heightAnchor, multiplier: 1/3)
        passwordTextFieldHeightAnchor?.isActive = true
        
    }
    
    fileprivate func setupLoginRegisterButton() {
        loginRegisterButton.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 0).isActive = true
        loginRegisterButton.topAnchor.constraint(equalTo: inputsContainerView.bottomAnchor, constant: 12).isActive = true
        loginRegisterButton.widthAnchor.constraint(equalTo: view.widthAnchor, constant: -24).isActive = true
        loginRegisterButton.heightAnchor.constraint(equalToConstant: 30).isActive = true
    }
    
    fileprivate func setupProfileImageView() {
        profileImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        profileImageView.topAnchor.constraint(equalTo: view.topAnchor, constant: 0).isActive = true
        profileImageView.widthAnchor.constraint(equalToConstant: 130).isActive = true
        profileImageView.heightAnchor.constraint(equalToConstant: 130).isActive = true
    }
    
    fileprivate func setupLoginRegisterSegmentedControl() {
        loginRegisterSegmentedControl.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        loginRegisterSegmentedControl.topAnchor.constraint(equalTo: profileImageView.bottomAnchor, constant: 10).isActive = true
        loginRegisterSegmentedControl.widthAnchor.constraint(equalTo: view.widthAnchor, constant: -48).isActive = true
        loginRegisterSegmentedControl.heightAnchor.constraint(equalToConstant: 30).isActive = true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor(r: 61, g: 91, b: 151, a: 1)
        view.addSubview(profileImageView)
        view.addSubview(loginRegisterSegmentedControl)
        view.addSubview(inputsContainerView)
        view.addSubview(loginRegisterButton)
        
        setupProfileImageView()
        setupLoginRegisterSegmentedControl()
        setupInputsContainerView()
        setupLoginRegisterButton()
        handleLoginRegisterChange()
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
}


extension UIColor {
    convenience init(r: CGFloat, g: CGFloat, b: CGFloat, a: CGFloat) {
        self.init(red: r/255, green: g/255, blue: b/255, alpha: a)
    }
}
