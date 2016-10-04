//
//  ViewController.swift
//  PageMenuA1
//
//  Created by Jakkawad Chaiplee on 10/4/2559 BE.
//  Copyright © 2559 Jakkawad Chaiplee. All rights reserved.
//

import UIKit
import PageMenu

class ViewController: UIViewController {

    var pageMenu: CAPSPageMenu?
    
    func pageMenuSetUp() {
        self.title = "PAGE MENU"
        self.navigationController?.navigationBar.barTintColor = UIColor(red: 18/255.0, green: 137/255.0, blue: 142/255.0, alpha: 1.0)
        self.navigationController?.navigationBar.shadowImage = UIImage()
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: UIBarMetrics.default)
        self.navigationController?.navigationBar.barStyle = UIBarStyle.black
        self.navigationController?.navigationBar.tintColor = UIColor.white
        self.navigationController?.navigationBar.titleTextAttributes = [NSForegroundColorAttributeName: UIColor.orange]
        
        //self.navigationItem.leftBarButtonItem = UIBarButtonItem(title: "<-", style: UIBarButtonItemStyle.Done, target: self, action: "didTapGoToLeft")
        //self.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "->", style: UIBarButtonItemStyle.Done, target: self, action: "didTapGoToRight")
        
        let mainStoryboard: UIStoryboard = UIStoryboard(name: "Main",bundle: nil)
        var controllerArray : [UIViewController] = []
        
        let controller1 = mainStoryboard.instantiateViewController(withIdentifier: "Menu1Story") as! Page1ViewController
        //controller1.parentNavigationController = self.navigationController
        controller1.title = "Menu1"
        controllerArray.append(controller1)
        
        let controller2 = mainStoryboard.instantiateViewController(withIdentifier: "Menu2Story") as! Page2ViewController
        //controller1.parentNavigationController = self.navigationController
        controller2.title = "Menu2"
        controllerArray.append(controller2)
        
//        let controller3 = mainStoryboard.instantiateViewControllerWithIdentifier("Menu3Story") as! Menu3ViewController
//        //controller1.parentNavigationController = self.navigationController
//        controller3.title = "Menu3"
//        controllerArray.append(controller3)
//        
//        let controller4 = mainStoryboard.instantiateViewControllerWithIdentifier("Menu4Story") as! Menu4ViewController
//        controller4.title = "Menu4"
//        controllerArray.append(controller4)
        
        
        // Customize menu (Optional)
        let parameters: [CAPSPageMenuOption] = [
            .scrollMenuBackgroundColor(UIColor(red: 18/255.0, green: 137/255.0, blue: 142/255.0, alpha: 1.0)),
            .viewBackgroundColor(UIColor(red: 20.0/255.0, green: 20.0/255.0, blue: 20.0/255.0, alpha: 1.0)),
            .selectionIndicatorColor(UIColor.orange),
            .bottomMenuHairlineColor(UIColor(red: 70.0/255.0, green: 70.0/255.0, blue: 80.0/255.0, alpha: 1.0)),
            .menuItemFont(UIFont(name: "HelveticaNeue", size: 13.0)!),
            .menuHeight(40.0),
            .menuItemWidth(50.0),
            .centerMenuItems(true),
            .useMenuLikeSegmentedControl(true)
        ]
        
        // Initialize scroll menu
        pageMenu = CAPSPageMenu(viewControllers: controllerArray, frame: CGRect(x: 0.0, y: 0.0, width: self.view.frame.width, height: self.view.frame.height), pageMenuOptions: parameters)
        
        
        
        self.addChildViewController(pageMenu!)
        self.view.addSubview(pageMenu!.view)
        
        pageMenu!.didMove(toParentViewController: self)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        pageMenuSetUp()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

