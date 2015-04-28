//
//  RootViewController.m
//  DigitalMtLib
//
//  Created by Victor Chen on 4/7/15.
//  Copyright (c) 2015 Digital Mt. Inc. All rights reserved.
//

#import "RootViewController.h"
#import "TextViewController.h"
#import "ShapeViewController.h"
#import "ProfileViewController.h"

@interface RootViewController ()
@property (nonatomic, strong) NSArray *sectionTitles;
@property (nonatomic, strong) NSArray *rowTitles;
@end

@implementation RootViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = @"Mt. Zendo";
    self.sectionTitles = @[@"Device",
                           @"Shape View",
                           @"User Interface"];
    
    self.rowTitles = @[
                       @[@"Infomation"],//section 1
                       @[@"Hexagon",@"Oval",@"Star",@"Rectangle"],//section 2
                       @[@"Profile Photo View"],
                       ];
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
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    
    
    UIView *v = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 15)];
    v.layer.borderWidth = 0.4f;
    v.layer.borderColor = [UIColor darkGrayColor].CGColor;
    v.backgroundColor = [UIColor colorWithWhite:.5f alpha:0.35f];
    v.layer.borderWidth = 0.4f;
    v.layer.borderColor = [UIColor lightGrayColor].CGColor;
    v.backgroundColor = [UIColor darkGrayColor];
//    [UIColor colorWithWhite:1.0f alpha:0.8f];
    
    
    UILabel *lbl1 = [[UILabel alloc] initWithFrame:CGRectMake(5, 0, tableView.bounds.size.width, 30)];
    lbl1.textAlignment = NSTextAlignmentLeft;
    lbl1.backgroundColor = [UIColor clearColor];
    lbl1.text = [self.sectionTitles objectAtIndex:section];
    lbl1.font = [UIFont boldSystemFontOfSize:15];
    lbl1.textColor = [UIColor whiteColor];
    lbl1.autoresizingMask = UIViewAutoresizingFlexibleWidth;
    [v addSubview:lbl1];
    
    
    return v;
    
    
}


//- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
//    return [self.sectionTitles objectAtIndex:section];
//}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    // Return the number of sections.
    return self.sectionTitles.count;
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    // Return the number of rows in the section.
    return [(NSArray *)[self.rowTitles objectAtIndex:section] count];
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
    
    cell.textLabel.text = [(NSArray *)[self.rowTitles objectAtIndex:indexPath.section] objectAtIndex:indexPath.row];
    
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
    
    if (indexPath.section == 0) {//Device
        if (indexPath.row == 0) {//infromation
            
            UIDevice *dev =  [[UIDevice alloc] init];
           
            TextViewController *controller = [[TextViewController alloc] initWithNibName:NSStringFromClass([TextViewController class]) bundle:nil];
            controller.title = NSLocalizedString(@"Device Infomation", @"");
            [controller setupText:[dev description]];
            [self.navigationController pushViewController:controller animated:YES];
            
        }
    }
    else if (indexPath.section == 1){//shape view
        switch (indexPath.row) {
            case 0://Hexagon
            {
                ShapeViewController *controller = [[ShapeViewController alloc] initWithNibName:NSStringFromClass([ShapeViewController class]) bundle:nil];
                controller.type = OutlineTypeHexagon;
                [self.navigationController pushViewController:controller animated:YES];
            }
                break;
            case 1://Oval
            {
                ShapeViewController *controller = [[ShapeViewController alloc] initWithNibName:NSStringFromClass([ShapeViewController class]) bundle:nil];
                controller.type = OutlineTypeOval;
                [self.navigationController pushViewController:controller animated:YES];
            }
                break;
            case 2://Star
            {
                ShapeViewController *controller = [[ShapeViewController alloc] initWithNibName:NSStringFromClass([ShapeViewController class]) bundle:nil];
                controller.type = OutlineTypeStar;
                [self.navigationController pushViewController:controller animated:YES];
            }
                break;
            case 3://Rectangle
            {
                ShapeViewController *controller = [[ShapeViewController alloc] initWithNibName:NSStringFromClass([ShapeViewController class]) bundle:nil];
                controller.type = OutlineTypeRectangle;
                [self.navigationController pushViewController:controller animated:YES];
            }
                break;
            default:
            {
                
            }
                break;
        }//end switch
    }
    else if (indexPath.section == 2){//user interface
        switch (indexPath.row) {
            case 0://Profile Photo View
            {
                ProfileViewController *controller = [[ProfileViewController alloc] initWithNibName:NSStringFromClass([ProfileViewController class]) bundle:nil];
                [self.navigationController pushViewController:controller animated:YES];
                
            }
                break;
            default:
            {
                
            }
                break;
        }//end switch
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
