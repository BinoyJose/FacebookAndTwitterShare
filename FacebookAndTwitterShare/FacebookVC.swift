//
//  FacebookVC.swift
//  FacebookAndTwitterShare
//
//  Created by Mohsin on 21/02/2015.
//  Copyright (c) 2015 PanaCloud. All rights reserved.
//

// temp

import UIKit

class FacebookVC: UIViewController, FBLoginViewDelegate {
    
    @IBOutlet var fbLoginView : FBLoginView!
    
    var firstName: String!
    
    var lastName: String!
    
    var email: String!
    


    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        self.fbLoginView.center = self.view.center
        
        self.fbLoginView.delegate = self
        self.fbLoginView.readPermissions = ["public_profile","email","user_friends"]
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
    func loginViewShowingLoggedInUser(loginView : FBLoginView!) {
        println("User Logged In")
        println("This is where you can perform a segue.")
    }
    
    func loginViewFetchedUserInfo(loginView : FBLoginView!, user: FBGraphUser) {
        self.firstName = user.first_name
        self.lastName = user.last_name
        FBRequestConnection.startForMeWithCompletionHandler { (connection, user1, error) -> Void in
            if (error == nil){
               // self.email = user.objectForKey("email") as String
                
                println(user)
                self.performSegueWithIdentifier("showView", sender: self)
            }
        }
    }
    
    func loginViewShowingLoggedOutUser(loginView : FBLoginView!) {
        println("User Logged Out")
    }
    
    func loginView(loginView : FBLoginView!, handleError:NSError) {
        println("Error: \(handleError.localizedDescription)")
    }
    
    

    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        if (segue.identifier == "showView"){
            var vc: NewViewController = segue.destinationViewController as NewViewController
            vc.firstName = self.firstName
            vc.lastName = self.lastName
            vc.email = self.email
        }
        
    }

}
