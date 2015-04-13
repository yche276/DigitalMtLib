//
//  RootViewController.m
//  DigitalMtLib
//
//  Created by Victor Chen on 4/7/15.
//  Copyright (c) 2015 Digital Mt. Inc. All rights reserved.
//

#import "RootViewController.h"
#import "TextViewController.h"

#import "DigitalMt.h"

@interface RootViewController ()

@end

@implementation RootViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = @"Mt. Zendo";
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

#pragma mark -
#pragma mark Table view data source
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    // Return the number of sections.
    return 1;
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    // Return the number of rows in the section.
    return 1;
}

// Customize the appearance of table view cells.
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *CellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        cell.textLabel.font = [UIFont systemFontOfSize:16];
    }
//    cell.textLabel.text = [NSString stringWithFormat:@"Cell %ld", (long)indexPath.row];
    
    switch (indexPath.row) {
        case 0:
        {
            cell.textLabel.text = NSLocalizedString(@"Device Infomation", @"");
        }
            break;
            
        default:
            break;
    }
    
    return cell;
}
#pragma mark -
#pragma mark Table view delegate
//- (NSArray*)visibleCells
//{
//    return [self.clockTableView visibleCells];
//}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    // Navigation logic may go here. Create and push another view controller.
    
    if (indexPath.row == 0) {
        
        UIDevice *dev =  [[UIDevice alloc] init];
        NSString *strPlatform = [dev platformString];
        NSLog(@"strPlatform = %@", strPlatform);
        NSLog(@"description = %@", [dev description]);
        
        
        if (dev.type == DEVICE_TYPE_IPAD) {
            NSLog(@"DEVICE_TYPE_IPAD");
        }
        
        TextViewController *controller = [[TextViewController alloc] initWithNibName:NSStringFromClass([TextViewController class]) bundle:nil];
        controller.title = NSLocalizedString(@"Device Infomation", @"");
        controller.textView.selectable = NO;
        controller.textView.editable = NO;
        [self.navigationController pushViewController:controller animated:YES];
    }
    
}

//- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
//    UIView *v = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 30)];
//    v.layer.borderWidth = 0.4f;
//    v.layer.borderColor = [UIColor lightGrayColor].CGColor;
//    v.backgroundColor = [UIColor colorWithWhite:1.0f alpha:0.8f];
//    
//    
//    UILabel *lbl = [[UILabel alloc] initWithFrame:CGRectMake(10, 4, tableView.bounds.size.width, 15)];
//    lbl.textAlignment = NSTextAlignmentLeft;
//    lbl.backgroundColor = [UIColor clearColor];
//    lbl.text = [self.sectionTitleArray objectAtIndex:section];
//    lbl.font = [UIFont systemFontOfSize:14];
//    lbl.textColor = [UIColor blackColor];
//    lbl.autoresizingMask = UIViewAutoresizingFlexibleWidth;
//    [v addSubview:lbl];
//    return v;
//    
//}

@end
