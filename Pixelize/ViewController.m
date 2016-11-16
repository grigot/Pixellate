//
//  ViewController.m
//  Pixelize
//
//  Created by Guy Rigot on 16-11-16.
//  Copyright © 2016 Guy Rigot. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

-(void)viewDidAppear:(BOOL)animated{
    
    if(self.image==nil){
        
        self.picker=[[UIImagePickerController alloc] init];
        
        self.picker.sourceType=UIImagePickerControllerSourceTypePhotoLibrary;
        self.picker.delegate=self;
        
        
        [self presentViewController:self.picker animated:YES completion:^{
            
        }];
    }
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary<NSString *,id> *)info{
    self.image=info[@"UIImagePickerControllerOriginalImage"];
    self.imageView.image=self.image;
    
    self.slider.maximumValue=1000;
    self.slider.minimumValue=1;
    self.slider.value=1;
    self.slider.continuous=NO;
    
//    self.imageView.image=[ViewController pixelatedImageWithImage:self.image withScale:8];
    
    [picker dismissViewControllerAnimated:YES completion:nil];
    
}
- (IBAction)sliderChanged:(id)sender {
    CGFloat value = round(self.slider.value);
    
    self.imageView.image=[ViewController pixelatedImageWithImage:self.image withScale:value];
    
}

+(UIImage*)pixelatedImageWithImage:(UIImage *)image withScale:(NSUInteger) scale{
    CIFilter* filter = [CIFilter filterWithName:@"CIPixellate"];
    
    CIImage * ciImage = [[CIImage alloc] initWithImage:image];
    
    [filter setValue:ciImage forKey:@"inputImage"];
    [filter setValue:[NSNumber numberWithDouble:scale] forKey:@"inputScale"];


    
    CIContext * context = [CIContext contextWithOptions:nil];
    
    CGImageRef ref = [context createCGImage:filter.outputImage fromRect:filter.outputImage.extent];
    UIImage * output = [UIImage imageWithCGImage:ref scale:image.scale orientation:image.imageOrientation];
    CGImageRelease(ref);
    
    return output;
    
//    return [UIImage imageWithCIImage:filter.outputImage];
}

@end
