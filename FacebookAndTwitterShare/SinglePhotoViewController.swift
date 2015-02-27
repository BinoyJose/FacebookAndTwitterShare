//
//  SinglePhotoViewController.swift
//  FacebookAndTwitterShare
//
//  Created by Mohsin on 28/02/2015.
//  Copyright (c) 2015 PanaCloud. All rights reserved.
//

import UIKit

class SinglePhotoViewController: UIViewController {

    
    @IBOutlet weak var img: UIImageView!
    var photo : UIImage!
    
    override func viewDidLoad() {
        
        if self.photo != nil {
            self.img.image = self.photo
        }
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue!, sender: AnyObject!) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
