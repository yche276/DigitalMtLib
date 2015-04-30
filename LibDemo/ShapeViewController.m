//
//  ShapeViewController.m
//  MtZendoLib
//
//  Created by Victor Chen on 4/27/15.
//  Copyright (c) 2015 Digital Mt. Inc. All rights reserved.
//

#import "ShapeViewController.h"

@interface ShapeViewController ()

@end

@implementation ShapeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    int max = 255;
    int min = 0;
    int r = min + rand() % (max-min);//232
    int g = min + rand() % (max-min);//19
    int b = min + rand() % (max-min);//159
    
    
    switch (self.type) {
        case OutlineTypeHexagon:
        {
            MZShapeView *v = [[MZShapeView alloc] initWithFrame:CGRectMake(0, 0, 300, 300)];
            v.translatesAutoresizingMaskIntoConstraints = NO;
            v.type = OutlineTypeHexagon;
            v.strokeColor = [UIColor colorWithRed:(float)232/255 green:(float)19/255 blue:(float)159/255 alpha:1.0f];
            v.fillColor = [UIColor colorWithRed:(float)74/255 green:(float)81/255 blue:(float)109/255 alpha:1.0f];
            v.strokeWidth = 5;
            v.cornerRadius = 15.0f;
            [v setNeedsDisplay];
            [self.view addSubview:v];
            
            // Width constraint, half of parent view width
            [self.view addConstraint:[NSLayoutConstraint constraintWithItem:v
                                                                  attribute:NSLayoutAttributeWidth
                                                                  relatedBy:NSLayoutRelationEqual
                                                                     toItem:self.view
                                                                  attribute:NSLayoutAttributeWidth
                                                                 multiplier:1
                                                                   constant:0]];
            
            // Height constraint, half of parent view height
            [self.view addConstraint:[NSLayoutConstraint constraintWithItem:v
                                                                  attribute:NSLayoutAttributeHeight
                                                                  relatedBy:NSLayoutRelationEqual
                                                                     toItem:self.view
                                                                  attribute:NSLayoutAttributeHeight
                                                                 multiplier:1
                                                                   constant:0]];
            
            // Center horizontally
            [self.view addConstraint:[NSLayoutConstraint constraintWithItem:v
                                                                  attribute:NSLayoutAttributeCenterX
                                                                  relatedBy:NSLayoutRelationEqual
                                                                     toItem:self.view
                                                                  attribute:NSLayoutAttributeCenterX
                                                                 multiplier:1.0
                                                                   constant:0.0]];
            
            // Center vertically
            [self.view addConstraint:[NSLayoutConstraint constraintWithItem:v
                                                                  attribute:NSLayoutAttributeCenterY
                                                                  relatedBy:NSLayoutRelationEqual
                                                                     toItem:self.view
                                                                  attribute:NSLayoutAttributeCenterY
                                                                 multiplier:1.0
                                                                   constant:0.0]];
        }
            break;
        case OutlineTypeOval:
        {
            MZShapeView *v1 = [[MZShapeView alloc] initWithFrame:CGRectMake(0, 0, 300, 300)];
            v1.translatesAutoresizingMaskIntoConstraints = NO;
            v1.type = OutlineTypeOval;
            v1.strokeColor = [UIColor colorWithRed:(float)38/255 green:(float)175/255 blue:(float)197/255 alpha:1.0f];
            v1.fillColor = [UIColor colorWithRed:(float)74/255 green:(float)81/255 blue:(float)109/255 alpha:1.0f];
            v1.strokeWidth = 5;
            [v1 setNeedsDisplay];
            [self.view addSubview:v1];
            
            [v1 motionManagerUpdate:YES];
            
            // Width constraint, half of parent view width
            [self.view addConstraint:[NSLayoutConstraint constraintWithItem:v1
                                                                  attribute:NSLayoutAttributeWidth
                                                                  relatedBy:NSLayoutRelationEqual
                                                                     toItem:self.view
                                                                  attribute:NSLayoutAttributeWidth
                                                                 multiplier:1
                                                                   constant:0]];
            
            // Height constraint, half of parent view height
            [self.view addConstraint:[NSLayoutConstraint constraintWithItem:v1
                                                                  attribute:NSLayoutAttributeHeight
                                                                  relatedBy:NSLayoutRelationEqual
                                                                     toItem:self.view
                                                                  attribute:NSLayoutAttributeHeight
                                                                 multiplier:1
                                                                   constant:0]];
            
            // Center horizontally
            [self.view addConstraint:[NSLayoutConstraint constraintWithItem:v1
                                                                  attribute:NSLayoutAttributeCenterX
                                                                  relatedBy:NSLayoutRelationEqual
                                                                     toItem:self.view
                                                                  attribute:NSLayoutAttributeCenterX
                                                                 multiplier:1.0
                                                                   constant:0.0]];
            
            // Center vertically
            [self.view addConstraint:[NSLayoutConstraint constraintWithItem:v1
                                                                  attribute:NSLayoutAttributeCenterY
                                                                  relatedBy:NSLayoutRelationEqual
                                                                     toItem:self.view
                                                                  attribute:NSLayoutAttributeCenterY
                                                                 multiplier:1.0
                                                                   constant:0.0]];
        }
            break;
        case OutlineTypeStar:
        {
            r = min + rand() % (max-min);//232
            g = min + rand() % (max-min);//19
            b = min + rand() % (max-min);//159
            
            MZShapeView *v2 = [[MZShapeView alloc] initWithFrame:CGRectMake(0, 0, 300, 300)];
            v2.translatesAutoresizingMaskIntoConstraints = NO;
            v2.type = OutlineTypeStar;
            v2.strokeColor = [UIColor colorWithRed:(float)r/255 green:(float)g/255 blue:(float)b/255 alpha:1.0f];
            v2.fillColor = [UIColor colorWithRed:(float)74/255 green:(float)81/255 blue:(float)109/255 alpha:1.0f];
            v2.strokeWidth = 5;
            [v2 setNeedsDisplay];
            [self.view addSubview:v2];
            
            
            
            // Width constraint, half of parent view width
            [self.view addConstraint:[NSLayoutConstraint constraintWithItem:v2
                                                                  attribute:NSLayoutAttributeWidth
                                                                  relatedBy:NSLayoutRelationEqual
                                                                     toItem:self.view
                                                                  attribute:NSLayoutAttributeWidth
                                                                 multiplier:1
                                                                   constant:0]];
            
            // Height constraint, half of parent view height
            [self.view addConstraint:[NSLayoutConstraint constraintWithItem:v2
                                                                  attribute:NSLayoutAttributeHeight
                                                                  relatedBy:NSLayoutRelationEqual
                                                                     toItem:self.view
                                                                  attribute:NSLayoutAttributeHeight
                                                                 multiplier:1
                                                                   constant:0]];
            
            // Center horizontally
            [self.view addConstraint:[NSLayoutConstraint constraintWithItem:v2
                                                                  attribute:NSLayoutAttributeCenterX
                                                                  relatedBy:NSLayoutRelationEqual
                                                                     toItem:self.view
                                                                  attribute:NSLayoutAttributeCenterX
                                                                 multiplier:1.0
                                                                   constant:0.0]];
            
            // Center vertically
            [self.view addConstraint:[NSLayoutConstraint constraintWithItem:v2
                                                                  attribute:NSLayoutAttributeCenterY
                                                                  relatedBy:NSLayoutRelationEqual
                                                                     toItem:self.view
                                                                  attribute:NSLayoutAttributeCenterY
                                                                 multiplier:1.0
                                                                   constant:0.0]];
        }
            break;
        case OutlineTypeRectangle:
        {
            r = min + rand() % (max-min);
            g = min + rand() % (max-min);
            b = min + rand() % (max-min);
            
            
            MZShapeView *v3 = [[MZShapeView alloc] initWithFrame:CGRectMake(50, 50, 300, 200)];
            v3.translatesAutoresizingMaskIntoConstraints = NO;
            v3.type = OutlineTypeRectangle;
            v3.strokeColor = [UIColor colorWithRed:(float)r/255 green:(float)g/255 blue:(float)b/255 alpha:1.0f];
            v3.fillColor = [UIColor colorWithRed:(float)74/255 green:(float)81/255 blue:(float)109/255 alpha:1.0f];
            v3.strokeWidth = 5;
            v3.cornerRadius = 10.0f;
            [v3 setNeedsDisplay];
            [self.view addSubview:v3];
            
            
            [self.view addConstraint:[NSLayoutConstraint constraintWithItem:v3
                                                                  attribute:NSLayoutAttributeWidth
                                                                  relatedBy:NSLayoutRelationEqual
                                                                     toItem:self.view
                                                                  attribute:NSLayoutAttributeWidth
                                                                 multiplier:0.9f
                                                                   constant:0]];
            
            [self.view addConstraint:[NSLayoutConstraint constraintWithItem:v3
                                                                  attribute:NSLayoutAttributeHeight
                                                                  relatedBy:NSLayoutRelationEqual
                                                                     toItem:self.view
                                                                  attribute:NSLayoutAttributeHeight
                                                                 multiplier:0.35f
                                                                   constant:0]];
            
            // Center horizontally
            [self.view addConstraint:[NSLayoutConstraint constraintWithItem:v3
                                                                  attribute:NSLayoutAttributeCenterX
                                                                  relatedBy:NSLayoutRelationEqual
                                                                     toItem:self.view
                                                                  attribute:NSLayoutAttributeCenterX
                                                                 multiplier:1.0
                                                                   constant:0.0]];
            
            // Center vertically
            [self.view addConstraint:[NSLayoutConstraint constraintWithItem:v3
                                                                  attribute:NSLayoutAttributeCenterY
                                                                  relatedBy:NSLayoutRelationEqual
                                                                     toItem:self.view
                                                                  attribute:NSLayoutAttributeCenterY
                                                                 multiplier:1.0
                                                                   constant:0.0]];
        }
            break;
            
        default:
        {
            DLog(LOG_ERROR, @"Wrong Type");
        }
            break;
    }
    
    
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

@end
