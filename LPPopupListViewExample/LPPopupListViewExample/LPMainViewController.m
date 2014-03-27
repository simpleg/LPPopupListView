//
//  LPMainViewController.m
//  LPPopupListViewExample
//
//  Created by Luka Penger on 27/03/14.
//  Copyright (c) 2014 Luka Penger. All rights reserved.
//

#import "LPMainViewController.h"


@interface LPMainViewController ()

@property (nonatomic, strong) NSMutableArray *selectedList;

@end


@implementation LPMainViewController

#pragma mark - Lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    NSDictionary *info = [[NSBundle mainBundle] infoDictionary];
    NSString *bundleName = [NSString stringWithFormat:@"%@", [info objectForKey:@"CFBundleDisplayName"]];
    self.title = bundleName;
}

#pragma mark - Button

- (IBAction)buttonClicked:(id)selector
{
    float paddingTopBottom = 20.0f;
    float paddingLeftRight = 20.0f;
    
    CGPoint point = CGPointMake(paddingLeftRight, (self.navigationController.navigationBar.frame.size.height + paddingTopBottom) + paddingTopBottom);
    CGSize size = CGSizeMake((self.view.frame.size.width - (paddingLeftRight * 2)), self.view.frame.size.height - ((self.navigationController.navigationBar.frame.size.height + paddingTopBottom) + (paddingTopBottom * 2)));
    
    LPPopupListView *listView = [[LPPopupListView alloc] initWithTitle:@"List View" list:[self list] selectedList:self.selectedList point:point size:size multipleSelection:YES];
    listView.delegate = self;
    
    [listView showInView:self.navigationController.view animated:YES];
}

#pragma mark - LPPopupListViewDelegate

- (void)popupListView:(LPPopupListView *)popUpListView didSelectedIndex:(NSInteger)index
{
    NSLog(@"popUpListView - didSelectedIndex: %d", index);
}

- (void)popupListViewDidHide:(LPPopupListView *)popUpListView selectedList:(NSArray *)list
{
    NSLog(@"popupListViewDidHide - selectedList: %@", list.description);
    
    self.selectedList = [NSMutableArray arrayWithArray:list];
    
    self.textView.text = self.selectedList.description;
}

#pragma mark - Array List

- (NSArray *)list
{
    return [NSArray arrayWithObjects:@"Car", @"Motor", @"Airplane", @"Boat", @"Bike", nil];
}

@end