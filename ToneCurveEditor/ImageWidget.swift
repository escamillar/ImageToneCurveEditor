//
//  ImageWidget.swift
//  ToneCurveEditor
//
//  Created by Simon Gladman on 12/09/2014.
//  Copyright (c) 2014 Simon Gladman. All rights reserved.
//

import UIKit

class ImageWidget: UIControl , UINavigationControllerDelegate, UIImagePickerControllerDelegate
{
    let blurOveray = UIVisualEffectView(effect: UIBlurEffect())
    let loadImageButton = UIButton(frame: CGRectZero)
    let imageView = UIImageView(frame: CGRectZero)
    
    var loadedImage : UIImage?
    
    weak var viewController : UIViewController?
    
    override init(frame: CGRect)
    {
        super.init(frame: frame)
 
        backgroundColor = UIColor.blackColor()
        
        imageView.contentMode = UIViewContentMode.ScaleAspectFit
        
        addSubview(imageView)
        addSubview(blurOveray)
        
        loadImageButton.setTitle("Load Image", forState: .Normal)
        loadImageButton.setTitleColor(UIColor.blackColor(), forState: .Normal)
        
        loadImageButton.addTarget(self, action: "loadImageButtonClickHandler:", forControlEvents: .TouchUpInside)
        
        addSubview(loadImageButton)
    }
    
    required init(coder aDecoder: NSCoder)
    {
        super.init(coder: aDecoder)
    }
    
    func loadImageButtonClickHandler(button : UIButton)
    {
        var imagePicker = UIImagePickerController()
        
        imagePicker.delegate = self
        imagePicker.allowsEditing = true
        imagePicker.sourceType = UIImagePickerControllerSourceType.SavedPhotosAlbum
        
        viewController!.presentViewController(imagePicker, animated: true, completion: nil)
    }
    
    func imagePickerController(picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [NSObject : AnyObject])
    {
        loadedImage = info[UIImagePickerControllerOriginalImage] as? UIImage;
        
        imageView.image = loadedImage

        viewController!.dismissViewControllerAnimated(true, completion: nil)
    }
    
    override func layoutSubviews()
    {
        blurOveray.frame = CGRect(x: 0, y: frame.height - 50, width: frame.width, height: 50)
   
        loadImageButton.frame = CGRect(x: 20, y: frame.height - 50, width: 100, height: 50)
    
        imageView.frame = CGRect(x: 5, y: 5, width: frame.width - 10, height: frame.height - 10)
    }
}
