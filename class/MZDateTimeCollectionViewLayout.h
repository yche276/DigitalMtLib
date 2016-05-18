//
//  MZDateTimeCollectionViewLayout.h
//  Clock
//
//  Created by Victor Chen on 1/29/16.
//  Copyright © 2016 Chen Yue. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MZDateTimeCollectionViewLayout : UICollectionViewLayout {
    
    
}
@property (nonatomic) UIEdgeInsets itemInsets;
@property (nonatomic) CGSize itemSize;
@property (nonatomic) CGFloat interItemSpacingY;
@property (nonatomic) CGFloat interItemSpacingX;
@property (nonatomic) NSInteger numberOfColumns;


@end
