//
//  NewViewController.swift
//  FacebookAndTwitterShare
//
//  Created by Mohsin on 21/02/2015.
//  Copyright (c) 2015 PanaCloud. All rights reserved.
//

import UIKit

class NewViewController: UIViewController {

    
    @IBOutlet weak var emailLabel: UILabel!
    @IBOutlet weak var lastNameLabel: UILabel!
    @IBOutlet weak var firstNameLabel: UILabel!
    
    var firstName: String!
    var lastName: String!
    var email: String!

    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        
        if (self.firstName != nil) {
            self.firstNameLabel.text = self.firstName
        }
        
        if (self.lastName != nil) {
            self.lastNameLabel.text = self.lastName
        }
        
        if (self.email != nil) {
            self.emailLabel.text = self.email
        }

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    


    // Get List Of Friends
    //var friendsRequest : FBRequest = FBRequest.requestForMyFriends()
    
//    let temp = FBRequest.requestForMyFriends().startWithCompletionHandler({(connection:FBRequestConnection!, result:AnyObject!, error:NSError!) -> Void in
//    
//        var resultdict = result as NSDictionary
//        println("Result Dict: \(resultdict)")
//        var data : NSArray = resultdict.objectForKey("data") as NSArray
//        
//        for i in 0..<data.count {
//            let valueDict : NSDictionary = data[i] as NSDictionary
//            let id = valueDict.objectForKey("id") as String
//            println("the id value is \(id)")
//        }
//        
//        var friends = resultdict.objectForKey("data") as NSArray
//        println("Found \(friends.count) friends")
//    })

    
    
    
}

    
    
    
    
    



