//
//  PhotoViewController.swift
//  lab-task-squirrel
//
//  Created by Temi on 2/4/25.
//

import UIKit

class PhotoViewController: UIViewController {
    
    @IBOutlet weak var photoView: UIImageView!  // ✅ Connected Outlet
    
    var task: Task!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // ✅ Set the task image in the ImageView
        photoView.image = task.image
    }
}

