//
//  homeViewController.h
//  ApiExample
//
//  Created by vignesh on 07/05/16.
//  Copyright © 2016 Home. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface homeViewController : UIViewController <UITableViewDelegate,UITableViewDataSource,UIImagePickerControllerDelegate>

@property (weak, nonatomic) IBOutlet UIImageView *coverPicImageView;

@property (weak, nonatomic) IBOutlet UITableView *newsTableView;



@end
