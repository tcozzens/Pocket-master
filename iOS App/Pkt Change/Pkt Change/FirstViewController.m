//
//  FirstViewController.m
//  Pkt Change
//
//  Created by Jake Tobin on 3/9/13.
//  Copyright (c) 2013 Jake Tobin. All rights reserved.
//

#import "FirstViewController.h"
#import "ImageStore.h"
#import "NSData+Base64.h"

@interface FirstViewController ()

@end

@implementation FirstViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)submitClicked:(id)sender {
    
    /*
    NSData *data = UIImagePNGRepresentation(image);
    NSString *encodedString = [data base64Encoding_xcd];
    
    NSString *jsonRequest = [NSString stringWithFormat:@"{\"Image\":\"%@\"}",encodedString];
    // NSLog(@"Request: %@", jsonRequest);
    
    NSURL *url = [NSURL URLWithString:@"http://10.14.200.26:8888"];
    
    NSMutableURLRequest *request = [[NSMutableURLRequest alloc] initWithURL:url];
    NSData *requestData = [NSData dataWithBytes:[jsonRequest UTF8String] length:[jsonRequest length]];
    
    [request setHTTPMethod:@"POST"];
    [request setValue:@"application/json" forHTTPHeaderField:@"Accept"];
    [request setValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
    [request setValue:[NSString stringWithFormat:@"%d", [requestData length]] forHTTPHeaderField:@"Content-Length"];
    [request setHTTPBody: requestData];
    
    NSURLConnection *connection = [NSURLConnection connectionWithRequest:request delegate:self];

    */

    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:[NSURL URLWithString:@"http://10.14.89.242:5000"] cachePolicy:NSURLRequestReloadIgnoringLocalCacheData timeoutInterval:10.0];
    
    [request setHTTPMethod:@"GET"];
    
    NSURLConnection *connection = [[NSURLConnection alloc] initWithRequest:request delegate:self];
    if (connection)
    {
        NSLog(@"NSURLConnection connection==true");
        NSURLResponse *response;
        NSError *err;
        NSData *responseData = [NSURLConnection sendSynchronousRequest:request returningResponse:&response error:&err];
        
        NSString * str = [[NSString alloc] initWithData:responseData encoding:NSUTF8StringEncoding];
    }

}

- (void)dealloc{
    NSLog(@"hello");
}

- (IBAction)takePicture:(id)sender {
    
    
    
    UIAlertView *useOfCamera = [[UIAlertView alloc]
                                    initWithTitle:@"FOR BEST USE:" message:@"Hold your iphone at least 8 inches above your change. A white back ground allows for best results, a black background does not allow the computation of change properly."  delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
    
    // Display the Hello World Message
    [useOfCamera show];
    
    
    
    
    
    
    
    
    UIImagePickerController *imagePicker =
    [[UIImagePickerController alloc] init];
    // If our device has a camera, we want to take a picture, otherwise, we
    // just pick from photo library
    if ([UIImagePickerController
         isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera]) {
        [imagePicker setSourceType:UIImagePickerControllerSourceTypeCamera];
    } else {
        [imagePicker setSourceType:UIImagePickerControllerSourceTypePhotoLibrary];
    }
    // This line of code will generate 2 warnings right now, ignore them
    [imagePicker setDelegate:self];
    // Place image picker on the screen
    [self presentModalViewController:imagePicker animated:YES];
    // The image picker will be retained by ItemDetailViewController
    // until it has been dismissed
}

- (IBAction)album:(id)sender {
    UIImagePickerController *imagePicker =
    [[UIImagePickerController alloc]init];
    if([UIImagePickerController
        isSourceTypeAvailable:UIImagePickerControllerSourceTypePhotoLibrary]){
        [imagePicker setSourceType:UIImagePickerControllerSourceTypePhotoLibrary];
    }
    // This line of code will generate 2 warnings right now, ignore them
    [imagePicker setDelegate:self];
    // Place image picker on the screen
    [self presentModalViewController:imagePicker animated:YES];
    // The image picker will be retained by ItemDetailViewController
    // until it has been dismissed

    
    
}

- (void)imagePickerController:(UIImagePickerController *)picker
didFinishPickingMediaWithInfo:(NSDictionary *)info{
    // Get picked image from info dictionary
    image = [info objectForKey:UIImagePickerControllerOriginalImage];
    // Put that image onto the screen in our image view
    [imageView setImage:image];
    // Take image picker off the screen -
    // you must call this dismiss method
    [self dismissModalViewControllerAnimated:YES];
}



@end
