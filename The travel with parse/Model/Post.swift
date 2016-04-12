//
//  Post.swift
//  The travel with parse
//
//  Created by Johnny' mac on 2016/4/12.
//  Copyright © 2016年 Johnny' mac. All rights reserved.
//

import Foundation

class Post: PFObject, PFSubclassing{
     var image: UIImage?
     @NSManaged var imageFile: PFFile?
     @NSManaged var user: PFUser?
     @NSManaged var text: PFObject?
static func parseClassName() -> String{
     return "Post"
    
    }
    override class func initialize(){
        var onceToken : dispatch_once_t = 0;
        dispatch_once(&onceToken){
        // inform Parse about this subclass
        self.registerSubclass()
        
        }
    
    
    }
    
    func uploadPost(){
        if let image = image{
        let imageData = UIImageJPEGRepresentation(image, 0.8)!
            let imageFile = PFFile(data: imageData)
            imageFile!.saveInBackgroundWithBlock(nil)
            self.imageFile = imageFile
            // any uploaded post should be associated with the current user
            user = PFUser.currentUser()
            saveInBackgroundWithBlock(nil)
        
        
        
        
        
        }
    
    
    
    }
}