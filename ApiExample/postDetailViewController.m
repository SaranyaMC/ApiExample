//
//  postDetailViewController.m
//  ApiExample
//
//  Created by vignesh on 07/05/16.
//  Copyright © 2016 Home. All rights reserved.
//

#import "postDetailViewController.h"
#import "homeViewController.h"

@interface postDetailViewController ()

@end

@implementation postDetailViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.postHeadingLabel.text = self.receivetitle;
    self.postLabel.text = self.receivesubtitle;
    self.postDetailsLabel.text = self.receivedescription;
    self.postCoverImageView.image = self.receiveimage;


}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];

}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
