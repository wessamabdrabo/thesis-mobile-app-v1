//
//  DetailsViewController.h
//  recSysAppV1
//
//  Created by Wessam Abdrabo on 7/26/15.
//  Copyright (c) 2015 tum. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "VideoCast.h"
@interface DetailsViewController : UIViewController
- (IBAction)watchVideoClicked:(id)sender;
@property (weak, nonatomic) IBOutlet UIImageView *imageView;
@property (weak, nonatomic) IBOutlet UILabel *videoTitle;
@property (weak, nonatomic) IBOutlet UITextView *videoLongDescr;
@property (strong, nonatomic) NSString* videoID;
//@property (strong, nonatomic) NSString* vidTitleText;
//@property (strong, nonatomic) NSString* vidLongDescrText;
//@property (strong, nonatomic) UIImage* vidImage;
@end
