//
//  postDetailViewController.h
//  ApiExample
//
//  Created by vignesh on 07/05/16.
//  Copyright © 2016 Home. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface postDetailViewController : UIViewController

@property (weak, nonatomic) IBOutlet UIImageView *postCoverImageView;

@property (weak, nonatomic) IBOutlet UILabel *postHeadingLabel;

@property (weak, nonatomic) IBOutlet UILabel *postLabel;

@property (weak, nonatomic) IBOutlet UITextView *postDetailsLabel;

@property (strong,nonatomic) NSString *receivetitle;

@property (strong,nonatomic) NSString *receivesubtitle;

@property (strong,nonatomic) NSString *receivedescription;

@property (strong,nonatomic) UIImage *receiveimage;

@end
