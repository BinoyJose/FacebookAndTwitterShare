//
//  FBUserModel.swift
//  FacebookAndTwitterShare
//
//  Created by Mohsin on 28/02/2015.
//  Copyright (c) 2015 PanaCloud. All rights reserved.
//

import Foundation


class User{
    let email:AnyObject = ""
    let name:AnyObject = ""
    let image:UIImage
    init(email:AnyObject, name:AnyObject, image:UIImage){
        self.image = image
        self.name = name
        self.email=email
    }
}