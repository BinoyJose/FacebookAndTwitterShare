//
//  AlbumViewController.swift
//  FacebookAndTwitterShare
//
//  Created by Mohsin on 28/02/2015.
//  Copyright (c) 2015 PanaCloud. All rights reserved.
//

import UIKit

class AlbumViewController: UITableViewController {
    
    var albumModel:AlbumModel = AlbumModel(name: "", link: "", cover:"");
    var fbHelper:FBHelper?
    var sources:[UIImage] = [UIImage]();
    var selectedPhoto: UIImage!
    var photoUrl : AnyObject!
    
    var notific : AnyObject!
    
    
    func photoExecuted(notification:NSNotification){
      //  let photos = notification.userInfo?["photos"]  as [UIImage];
        let photos = (notification.userInfo?["photos"] as NSArray) as [UIImage]
       // let photoUrl = (notification.userInfo?["sources"] as NSArray) as [NSString]
        
        self.sources = photos;
        self.tableView.reloadData();
    }
    
    override func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
    let img = self.sources[indexPath.row];
    return img.size.height;
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
    
    var cell = tableView.dequeueReusableCellWithIdentifier("Cell") as UITableViewCell;
    
    //cell.textLabel.text = self.sources[indexPath.row] as String;
    //let imageView = UIImageView(frame: CGRectMake(2, 2, 100, 100));
    //imageView.image = self.sources[indexPath.row];
    //cell.contentView.addSubview(imageView);
    cell.imageView?.image = self.sources[indexPath.row];
    return cell;
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return self.sources.count;
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        let photo = self.sources[indexPath.row];
        
        //println(self.photoUrl[indexPath.row])
        
        println(self.notific)
        

        
        
        performSegueWithIdentifier("ShowPhotoSeg", sender: photo)

        //self.singlePhotoViewController!.loadPhoto();
        
    }
    
    func executePhoto(){
        self.fbHelper!.fetchPhoto(self.albumModel.link);
    }
    
    func coverPhotoExecuted(notification:NSNotification){
        
        let photos = (notification.userInfo?["photos"] as NSArray) as [UIImage]
        let backgroundImage = UIImageView(image: photos[0]);
        
        self.tableView.backgroundView!.addSubview(backgroundImage);
    }
    
    override func viewDidLoad() {
                
        NSNotificationCenter.defaultCenter().addObserver(self, selector: Selector("photoExecuted:"), name: "photoNotification", object: nil);
        NSNotificationCenter.defaultCenter().addObserver(self, selector: Selector("coverPhotoExecuted:"), name: "coverPhotoNotification", object: nil);
        
        self.navigationItem.title = self.albumModel.name;
        
        super.viewDidLoad();
    }
    
    override func viewDidDisappear(animated: Bool) {
        NSNotificationCenter.defaultCenter().removeObserver(self, name: "coverPhotoNotification", object: nil);
        NSNotificationCenter.defaultCenter().removeObserver(self, name: "photoNotification", object: nil);
    }
    

    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if(segue.identifier == "ShowPhotoSeg"){
            let descVC = segue.destinationViewController as? SinglePhotoViewController;
            descVC?.photo = sender as UIImage
            
        }
    }
    
}
