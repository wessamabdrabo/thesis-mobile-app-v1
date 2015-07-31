//
//  MenuViewController.m
//  recSysAppV1
//
//  Created by Wessam Abdrabo on 7/31/15.
//  Copyright (c) 2015 tum. All rights reserved.
//

#import "MenuViewController.h"
#import "CategoryTableViewController.h"
#import "UIViewController+RESideMenu.h"


@interface MenuViewController ()
@property (strong, readwrite, nonatomic) UITableView *tableView;
@end

@implementation MenuViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.tableView = ({
        UITableView *tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, (self.view.frame.size.height - 54 * 5) / 2.0f, self.view.frame.size.width, 54 * 5) style:UITableViewStylePlain];
        tableView.autoresizingMask = UIViewAutoresizingFlexibleTopMargin | UIViewAutoresizingFlexibleBottomMargin | UIViewAutoresizingFlexibleWidth;
        tableView.delegate = self;
        tableView.dataSource = self;
        tableView.opaque = NO;
        tableView.backgroundColor = [UIColor clearColor];
        tableView.backgroundView = nil;
        tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        tableView.bounces = NO;
        tableView.scrollsToTop = NO;
        tableView;
    });
    [self.view addSubview:self.tableView];
}

#pragma mark -
#pragma mark UITableView Delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    CategoryTableViewController* categoryViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"categoriesViewController"];
    categoryViewController.categoryName = @"activism";
    switch (indexPath.row) {
        case 0: //Home
            [self.sideMenuViewController setContentViewController:[[UINavigationController alloc] initWithRootViewController:[self.storyboard instantiateViewControllerWithIdentifier:@"firstViewController"]]
                                                         animated:YES];
            [self.sideMenuViewController hideMenuViewController];
            break;
        case 3: //activism
            [self.sideMenuViewController setContentViewController:[[UINavigationController alloc] initWithRootViewController:categoryViewController]];
            [self.sideMenuViewController hideMenuViewController];
            break;
        /*case 1: //Profile
            [self.sideMenuViewController setContentViewController:[[UINavigationController alloc] initWithRootViewController:[self.storyboard instantiateViewControllerWithIdentifier:@"secondViewController"]]
                                                         animated:YES];
            [self.sideMenuViewController hideMenuViewController];
            break;*/
        default:
            break;
    }
}

#pragma mark -
#pragma mark UITableView Datasource

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
   // return 54;
    return indexPath.row <=2 ? 44 : 34;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)sectionIndex
{
    return 20;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
        cell.backgroundColor = [UIColor clearColor];
        cell.textLabel.font = [UIFont fontWithName:@"HelveticaNeue" size:21 ];
        cell.textLabel.textColor = [UIColor whiteColor];
        cell.textLabel.highlightedTextColor = [UIColor lightGrayColor];
        cell.selectedBackgroundView = [[UIView alloc] init];
    }
    
    cell.textLabel.font = [UIFont fontWithName:@"HelveticaNeue" size:indexPath.row <= 2 ? 21 : 15];

    NSArray *titles = @[@"Home", @"Profile", /*@"Log Out", @" ",*/ @"Categories",
                        @"   Activism", @"   Arts", @"   Business",@"   Computers",
                        @"   Creativity",@"   Design",@"   Economics", @"   Environment",
                        @"   Feminism",@"   History", @"   Math", @"   Music",
                        @"   Philosophy",@"   Photography", @"   Psychology",
                        @"   Software", @"   Sports"];
    NSArray *images = @[@"IconHome", @"IconProfile", @"IconEmpty",@"IconEmpty",@"IconEmpty",@"IconEmpty",@"IconEmpty",@"IconEmpty",@"IconEmpty",@"IconEmpty",@"IconEmpty",@"IconEmpty",@"IconEmpty",@"IconEmpty",@"IconEmpty",@"IconEmpty",@"IconEmpty",@"IconEmpty",@"IconEmpty",@"IconEmpty"/*,@"IconEmpty",@"IconEmpty"*/];
    cell.textLabel.text = titles[indexPath.row];
    cell.imageView.image = [UIImage imageNamed:images[indexPath.row]];
    
    return cell;
}


@end
