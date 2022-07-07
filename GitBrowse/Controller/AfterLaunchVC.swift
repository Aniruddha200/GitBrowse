//
//  ViewController.swift
//  GitBrowse
//
//  Created by Sunday on 07/07/22.
//

import UIKit

class AfterLaunchVC: UIViewController {

    lazy var launchView : AfterLaunchView = {
        let view  = AfterLaunchView()
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .darkGray
        navigationController?.navigationBar.isHidden = true
        
        // Setting Views and controllers
        setUI()
        controllers()
    }
    
    func setUI() {
        view.addSubview(launchView)
        view.addConstraintsWithFormat(format: "V:|[v0]|", views: launchView)
        view.addConstraintsWithFormat(format: "H:|[v0]|", views: launchView)
    }
    
    func controllers(){
        launchView.signUpButton.addTarget(self, action: #selector(signUPBtnAction), for: .touchUpInside)
        launchView.loginButton.addTarget(self, action: #selector(loginBtnAction), for: .touchUpInside)
    }
    
    //MARK:- View Navigation
    @objc func signUPBtnAction(){
        //
    }
    
    @objc func loginBtnAction() {
        //
    }


}

