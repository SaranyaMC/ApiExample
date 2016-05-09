//
//  homeViewController.m
//  ApiExample
//
//  Created by vignesh on 07/05/16.
//  Copyright © 2016 Home. All rights reserved.
//

#import "homeViewController.h"
#import "newsTableViewCell.h"
#import "postDetailViewController.h"
#import <SDWebImage/UIImageView+WebCache.h>
#define BASEURL @"http://iroidtech.com/wecare/api/news_events/list?&format=json"
#define IMAGE_URL @"http://iroidtech.com/wecare/uploads/news_events/"

@interface homeViewController ()
{
    
    NSMutableArray *dataArray;
    
}
@end

@implementation homeViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.newsTableView.delegate = self;
    self.newsTableView.dataSource = self;

    dataArray = [[NSMutableArray alloc]init];
    [self getEventListFromWeb];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

-(void)getEventListFromWeb
{
    
    NSString *urlString = [NSString stringWithFormat:@"%@",BASEURL];
    NSURL *url = [NSURL URLWithString:urlString];
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url];
    [NSURLConnection sendAsynchronousRequest:request queue:[NSOperationQueue mainQueue] completionHandler:^(NSURLResponse * _Nullable response, NSData * _Nullable data, NSError * _Nullable connectionError)
     {
         id responseData = [NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:&connectionError];
         dataArray = (NSMutableArray*)responseData;
         NSLog(@"%@",responseData);
         [self.newsTableView reloadData];
     }

     ];
    
    
    
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    
    return 1;
    
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    
    
    return dataArray.count;
    
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    static NSString *sampleIdentifier = @"news";
    newsTableViewCell *cell = (newsTableViewCell *)[tableView dequeueReusableCellWithIdentifier:sampleIdentifier];
    cell.postHeadingLabel.text = [NSString stringWithFormat:@"%@",dataArray[indexPath.row][@"title"]];
    cell.postShortDetailsLabel.text = [NSString stringWithFormat:@"%@",dataArray[indexPath.row][@"description"]];
    
    NSString *imgFullPath = [NSString stringWithFormat:@"%@%@",IMAGE_URL,dataArray[indexPath.row][@"image"]];
    [cell.postImageView sd_setImageWithURL:[NSURL URLWithString:imgFullPath]
                      placeholderImage:Nil];
    
    #pragma mark - TapGesture
    
    cell.postImageView.userInteractionEnabled = YES;
    cell.postImageView.tag = indexPath.row;
    UITapGestureRecognizer *tapped = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(myTap:)];
    tapped.numberOfTapsRequired = 1;
    [cell.postImageView addGestureRecognizer:tapped];
    return cell;
    
}

-(void)myTap :(id) sender
{
    UITapGestureRecognizer *gesture = (UITapGestureRecognizer *) sender;
    NSString *imgFullPath = [NSString stringWithFormat:@"%@%@",IMAGE_URL,dataArray[gesture.view.tag][@"image"]];
    [self.coverPicImageView sd_setImageWithURL:[NSURL URLWithString:imgFullPath]
                                                          placeholderImage:Nil];
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:
                                @"Main" bundle:[NSBundle mainBundle]];
    
    postDetailViewController *privacy = (postDetailViewController *)[storyboard instantiateViewControllerWithIdentifier:@"postDetailViewController"];
    
    privacy.receivetitle = dataArray[indexPath.row][@"title"];
    privacy.receivesubtitle = dataArray[indexPath.row][@"subtitle"];
    privacy.receivedescription = dataArray[indexPath.row][@"description"];
    NSString *imgFullPath = [NSString stringWithFormat:@"%@%@",IMAGE_URL,dataArray[indexPath.row][@"image"]];
    privacy.receiveimage = [UIImage imageWithData:[NSData dataWithContentsOfURL:[NSURL URLWithString:imgFullPath]]];
    
    [self.navigationController pushViewController:privacy animated:YES];

}


@end
