//
//  ViewController1.swift
//  FacebookAndTwitterShare
//
//  Created by Mohsin on 28/02/2015.
//  Copyright (c) 2015 PanaCloud. All rights reserved.
//

import Foundation
import UIKit


class ViewController1: UIViewController,UITableViewDataSource,UITableViewDelegate {
    
    let fbHelper = FBHelper()
    var sources:[AlbumModel] = [AlbumModel]()
    var currentAlbumModel = AlbumModel(name: "", link: "", cover:"")
    var destController:AlbumViewController!
    
    @IBOutlet var albumTable : UITableView!
    @IBOutlet var imgProfile : UIImageView!
    
    @IBAction func fetchDataAction(sender : AnyObject) {
        fbHelper.fetchAlbum()
    }
    @IBOutlet var btnLoginLogout : UIButton!
    
    @IBAction func facebookLogoutAction(sender : AnyObject) {
        self.fbHelper.logout()
        self.btnLoginLogout.titleLabel?.text = "Login to Facebook"
    }
    @IBAction func facebookLoginAction(sender : AnyObject) {
        
        if(self.btnLoginLogout.titleLabel?.text == "Login to Facebook"){
            fbHelper.login()
        }
        else{
            fbHelper.logout()
        }
        
    }
    
    
    
    override func viewDidLoad() {
        
        
        self.destController = self.storyboard?.instantiateViewControllerWithIdentifier("AlbumVCID") as AlbumViewController
        
        
        
        NSNotificationCenter.defaultCenter().addObserver(self, selector: Selector("executeHandle:"), name: "PostData", object: nil)
        NSNotificationCenter.defaultCenter().addObserver(self, selector: Selector("executeAlbum:"), name: "albumNotification", object: nil)
        
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func tableView(tableView: UITableView!, didSelectRowAtIndexPath indexPath: NSIndexPath!)
    {
        self.currentAlbumModel = self.sources[indexPath.row]
        if(self.destController != nil){
            self.destController!.albumModel = self.currentAlbumModel
            self.destController!.fbHelper = self.fbHelper
            self.destController!.executePhoto()
        }
        performSegueWithIdentifier("photoSegue", sender: self)
        
    }
    
    func selectRowAtIndexPath(indexPath: NSIndexPath!, animated: Bool, scrollPosition: UITableViewScrollPosition){
        
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
                var cell:UITableViewCell = tableView.dequeueReusableCellWithIdentifier("Cell") as UITableViewCell
                let data = self.sources[indexPath.row]
                cell.textLabel?.text = data.name
                cell.detailTextLabel?.text = data.link
                if(data.cover != ""){
                    let coverPhotoURL = NSURL(string: data.cover)
                    let coverPhotoData = NSData(contentsOfURL: coverPhotoURL)
        
                    cell.imageView?.image = UIImage(data: coverPhotoData)
                    
                }
                return cell
    }

    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return self.sources.count
        
    }
    func executeAlbum(notification:NSNotification){
        //let data = notification.userInfo["data"] as? [AlbumModel]
        
        // could be an Error
        let data = (notification.userInfo?["data"] as NSArray) as [AlbumModel]
        self.sources = data
        self.albumTable.reloadData()
    }
    
    func executeHandle(notification:NSNotification){
        let userData = notification.object as User
        
        let name = userData.name as String
        let email = userData.email as String
        //lblName.text = name
        //lblEmail.text = email
        imgProfile.image = userData.image
        self.btnLoginLogout.titleLabel?.text = "Logout"
        
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if(segue.identifier == "photoSegue"){
            let destinitionController = segue.destinationViewController as AlbumViewController
            destinitionController.albumModel = self.currentAlbumModel
           // self.destController = destinitionController
        }
    }
    
    override func viewDidDisappear(animated: Bool) {
        NSNotificationCenter.defaultCenter().removeObserver(self, name: "PostData", object: nil)
        NSNotificationCenter.defaultCenter().removeObserver(self, name: "albumNotification", object: nil)
    }

    
}