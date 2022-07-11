//
//  TabBarVC.swift
//  GitBrowse
//
//  Created by Sunday on 09/07/22.
//

import UIKit


let progressstarted = "progressstarted"
let progressscompleted = "progressscompleted"

class TabBarVC: UITabBarController {

    let newView = UIView()
    

    let addBtn: UIButton = {
        let button = UIButton(type: .custom)
        button.frame = CGRect(x: 0, y: 0, width: 40, height: 40)
        button.backgroundColor = .white
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 32)
        button.setTitle("+", for: .normal)
        button.setTitleColor(UIColor.init(named: "#333333"), for: .normal)
        button.layer.borderColor = UIColor.init(named: "#333333")?.cgColor
        button.layer.borderWidth = 2.0
        button.layer.cornerRadius = 10.0
        return button
    }()
    
    let addTabBarItem = UITabBarItem(title: "Cloud", image: UIImage(systemName: "cloud.fill"), tag: 109)
    let activityIndicator = UIActivityIndicatorView()
    let backgroundView = UIView()
    var nextBar = UIView()
    let Start = Notification.Name(rawValue: progressstarted)
    let Completed = Notification.Name(rawValue: progressscompleted)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        self.tabBar.barTintColor = .white//#333333
        self.tabBar.unselectedItemTintColor = UIColor.darkGray
        var viewControllerList : [UIViewController] = [UIViewController]()
        viewControllerList = [setupHomeView(),profileView()]
        viewControllers = viewControllerList.map { UINavigationController(rootViewController: $0)}
//        CommonSettings.shared.updateProfileInfo(userID: CommonData.shared.getUserID() ?? ""){data in
//            if let profileResp = data{
//                CommonData.shared.userProfileDetails = profileResp.data
//                self.downloadAndSetProfileImage()
//            }
//        }
        createObserver()
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        //Mark user as logged In
        if !UserDefaults.standard.bool(forKey: DefaultConstants.isUserLogin){
            UserDefaults.standard.setValue(true, forKey: DefaultConstants.isUserLogin)
        }
        self.navigationController?.isNavigationBarHidden = true
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        dropShadow()
        makeBottomCornerRounded()
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
    }

    
   
    
    func createObserver() {
        NotificationCenter.default.addObserver(self, selector: #selector(TabBarVC.showprogress(notification:)), name: Start, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(TabBarVC.hideprogress(notification:)), name: Completed, object: nil)
    }
    
    
    @objc func showprogress(notification:NSNotification) {
        self.activityIndicator.sizeToFit()
//        self.activityIndicator.indicatorMode = .indeterminate
        self.activityIndicator.tintColor = .purple
//        self.activityIndicator.progress = 1
//        self.activityIndicator.radius = 15
//        self.activityIndicator.strokeWidth = 2
        self.activityIndicator.layer.position = self.view.center//.init(x: 55, y: 45)
        
        self.view.addSubview(self.activityIndicator)
        backgroundView.alpha = 0.5
        backgroundView.tag = 65
        //   let addTabBarItem = UITabBarItem(title: "in progress", image: UIImage(named: "addVideoIcon")!, tag: 109)
        addTabBarItem.isEnabled = false
        
        
        //        let theHeight =
        //        nextBar.frame = CGRect(x: 0, y: view.frame.size.height , width: self.view.frame.width, height: 50)
        
        self.activityIndicator.startAnimating()
    }
    
    @objc func hideprogress(notification:NSNotification) {
        DispatchQueue.main.async {
            self.activityIndicator.stopAnimating()
        }
        let addTabBarItem = UITabBarItem(title: "", image: UIImage(named: "addVideoIcon")!, tag: 109)
        addTabBarItem.isEnabled = true
    }
    
    func dropShadow() {
        self.tabBar.layer.borderWidth = 1
        self.tabBar.layer.borderColor = UIColor.gray.withAlphaComponent(0.2).cgColor
    }
    
    fileprivate func makeBottomCornerRounded() {
        if #available(iOS 11.0, *) {
            self.tabBar.layer.masksToBounds = true
            self.tabBar.isTranslucent = true
            self.tabBar.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
        } else {
            // Fallback on earlier versions
            let path = UIBezierPath(roundedRect: self.tabBar.bounds, byRoundingCorners: [.topLeft, .topRight], cornerRadii: CGSize(width: 20, height: 20))
            let maskLayer = CAShapeLayer()
            maskLayer.frame = self.tabBar.bounds
            maskLayer.path = path.cgPath
            self.tabBar.layer.mask = maskLayer
        }
    }
    
    
    
    //MARK: - Setup Sub Classes for Tab bar
    

    private func setupHomeView() -> UIViewController {
        //        let homeImage = UIImage(named: "homeIcon")!
        let homeController = UIViewController()
        homeController.title = "Home"
//        homeController.tabBar = self
//        let homeTabBarItemcenter = UITabBarItem(title: "Home", image: UIImage(named: "homeIcon"), tag: 100)
//        homeController.tabBarItem = homeTabBarItemcenter
        return homeController
    }
    
    
    private func profileView() -> UIViewController {
//        let profileImage = UIImage(named: "check_user_icon")
        //let artistImage = UIImage(named: "artistIcon")!
        //let targetSize = CGSize(width: 30, height: 30)
        //var profileImage = Utils.shared.resizeImage(image: artistImage, targetSize: targetSize)
        //profileImage = profileImage?.roundedImageOfSize(targetSize: targetSize)
        
        let profileController = UIViewController()
        profileController.title = "Profile"
//        profileController.tabBar = self
//        let profileTabBarItem = UITabBarItem(title: "Profile", image: profileImage, tag: 104)
//        profileController.tabBarItem = profileTabBarItem
        return profileController
    }
    
  

}
