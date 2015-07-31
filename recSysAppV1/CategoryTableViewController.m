//
//  CategoryTableViewController.m
//  recSysAppV1
//
//  Created by Wessam Abdrabo on 7/31/15.
//  Copyright (c) 2015 tum. All rights reserved.
//

#import "CategoryTableViewController.h"
#import "VideosDataManager.h"
#import "VideoCast.h"
#import "DetailsViewController.h"

@interface CategoryTableViewController (){
    NSArray* _categoryVideos;
}
@end

@implementation CategoryTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _categoryVideos = [[VideosDataManager sharedManager] getCategoryVideosName:self.categoryName];
    self.navigationItem.title = self.categoryName;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [_categoryVideos count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"videoDetailCell" forIndexPath:indexPath];
    
    VideoCast* video = [_categoryVideos objectAtIndex:indexPath.row];
    cell.textLabel.text = video.title;
    cell.detailTextLabel.text = video.duration;
    NSString *imageUrl = video.imgName;
    [NSURLConnection sendAsynchronousRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:imageUrl]] queue:[NSOperationQueue mainQueue] completionHandler:^(NSURLResponse *response, NSData *data, NSError *error) {
        cell.imageView.image = [UIImage imageWithData:data];
    }];
    return cell;
}



#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if([segue.identifier isEqualToString:@"categoryVideoDetailSegue"]){
        UITableViewCell *cell = (UITableViewCell*) sender;
        DetailsViewController* detailsViewController = [segue destinationViewController];
        detailsViewController.videoID = cell.textLabel.text;
    }
}


@end
