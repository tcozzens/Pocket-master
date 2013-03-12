//
//  FirstViewController.h
//  Pkt Change
//
//  Created by Jake Tobin on 3/9/13.
//  Copyright (c) 2013 Jake Tobin. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FirstViewController : UIViewController{
    IBOutlet UIImageView *imageView;
    UIImage *image;
}
- (IBAction)submitClicked:(id)sender;

- (IBAction)takePicture:(id)sender;

- (IBAction)album:(id)sender;

@end
