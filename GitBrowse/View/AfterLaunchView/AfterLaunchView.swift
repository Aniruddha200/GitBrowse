//
//  AfterLaunchView.swift
//  GitBrowse
//
//  Created by Sunday on 07/07/22.
//

import UIKit

class AfterLaunchView: BaseView {
    
    private let titleInfoLbl : UILabel = {
        let label = UILabel()
        label.text = "Welcome to the GITBrowser!"
        label.font = UIFont.boldSystemFont(ofSize: 16)
        label.textColor = .white
        label.numberOfLines = 0
        label.textAlignment = .center
        return label
    }()
    
//    private let titleInfomainLbl : UILabel = {
//        let label = UILabel()
//        label.text = "Powered by $CLOUT"// \n\n Powered by $CLOUT
//        label.font = FontBook.RobotoRegular.of(size: 12)
//        label.textColor = .white
//        label.numberOfLines = 0
//        label.textAlignment = .center
//        return label
//    }()

    lazy var signUpButton : UIButton = {
        let button = UIButton()
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)
        button.titleColor(for: .normal)
        button.setTitle("Sign up", for: .normal)
        button.setTitleColor(UIColor.red, for: .normal)
        button.backgroundColor = UIColor.white
        button.layer.cornerRadius = 10
        button.layer.borderColor = UIColor.white.cgColor
        button.layer.borderWidth = 1
        button.clipsToBounds = true
        return button
    }()

    lazy var loginButton : UIButton = {
        let button = UIButton()
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)
        button.titleColor(for: .normal)
        button.setTitle("Login", for: .normal)
        button.setTitleColor(UIColor.init(white: 1, alpha: 1), for: .normal)
        button.layer.cornerRadius = 10
        button.layer.borderColor = UIColor.white.cgColor
        button.layer.borderWidth = 1
        button.clipsToBounds = true
        return button
    }()

    
    
    override func setupViews() {
        
//Added Subviews below
        addSubview(titleInfoLbl)
        addSubview(signUpButton)
        addSubview(loginButton)
        
//Added Constrains below
//        addConstraintsWithFormat(format: "V:[v0(95)]-20-[v1(60)]-25-[v2]-40-[v3(50)]-15-[v4(50)]-(>=80)-|", views: titleInfoLbl, signUpButton,loginButton)
        
        addConstraintsWithFormat(format: "V:[v0]", views: titleInfoLbl)
        addConstraintsWithFormat(format: "H:|-48-[v0]-48-|", views: titleInfoLbl)
        addConstraint(NSLayoutConstraint(item: titleInfoLbl, attribute: .centerX, relatedBy: .equal, toItem: self, attribute: .centerX, multiplier: 1, constant: 0))
        addConstraint(NSLayoutConstraint(item: titleInfoLbl, attribute: .centerY, relatedBy: .equal, toItem: self, attribute: .centerY, multiplier: 1, constant: 0))
        
        
        addConstraintsWithFormat(format: "V:[v0]-40-[v1(50)]", views: titleInfoLbl, signUpButton)
        addConstraintsWithFormat(format: "H:|-48-[v0]-48-|", views: signUpButton)
        
        addConstraintsWithFormat(format: "V:[v0]-15-[v1(50)]-(>=80)-|", views: signUpButton, loginButton)
        addConstraintsWithFormat(format: "H:|-48-[v0]-48-|", views: loginButton)

    }

}
