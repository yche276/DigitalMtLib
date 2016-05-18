//
//  MZDateTimeCollectionViewCell.h
//  DateSelector
//
//  Created by Chen Yue on 8/02/16.
//  Copyright © 2016 Chen Yue. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MZDateTimeCollectionViewCell : UICollectionViewCell {
    
}

@property (strong, nonatomic) IBOutlet UILabel *titleLabel;
@property (strong, nonatomic) UIColor *lineColor;
@property (assign, nonatomic) NSUInteger lineWidth;
@end
