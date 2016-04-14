//
//  TimelineViewController.swift
//  The travel with parse
//
//  Created by Johnny' mac on 2016/4/11.
//  Copyright © 2016年 Johnny' mac. All rights reserved.
//

import UIKit


class TimelineViewController: UIViewController {
    
var photoTakingHelper: PhotoTakingHelper?


    
override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tabBarController?.delegate = self
    }

}
//MARK Tab Bar Delegate

extension TimelineViewController: UITabBarControllerDelegate {
    
    func tabBarController(tabBarController: UITabBarController, shouldSelectViewController viewController: UIViewController) -> Bool {
        if (viewController is PhotoViewController) {
            takePhoto()
            return false
        } else {
            return true
        }
    }
    
    func takePhoto(){
// instantiate photo taking class, provide callback for when photo  is selected
        photoTakingHelper = PhotoTakingHelper(viewController: self.tabBarController!,callback:{ (image: UIImage?)in
        let post = Post()
        post.image = image
            post.uploadPost()
}

)
}
}