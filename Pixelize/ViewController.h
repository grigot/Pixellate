//
//  ViewController.h
//  Pixelize
//
//  Created by Guy Rigot on 16-11-16.
//  Copyright © 2016 Guy Rigot. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController <UINavigationControllerDelegate,UIImagePickerControllerDelegate>

@property(nonatomic, strong)UIImage* image;
@property (weak, nonatomic) IBOutlet UIImageView *imageView;
@property (weak, nonatomic) IBOutlet UISlider *slider;
@property (strong, nonatomic)UIImagePickerController *picker;

@end

