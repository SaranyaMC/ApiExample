//
//  newsTableViewCell.h
//  ApiExample
//
//  Created by vignesh on 07/05/16.
//  Copyright © 2016 Home. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface newsTableViewCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UIImageView *postImageView;

@property (weak, nonatomic) IBOutlet UILabel *postHeadingLabel;

@property (weak, nonatomic) IBOutlet UILabel *postShortDetailsLabel;

@end
