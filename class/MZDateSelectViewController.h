//
//  MZDateSelectViewController.h
//  DateSelector
//
//  Created by Chen Yue on 7/02/16.
//  Copyright © 2016 Chen Yue. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MZDateTimeCollectionView.h"


@interface MZDateSelectViewController : UIViewController <UICollectionViewDataSource, UICollectionViewDelegate>{
    
    
}
@property (weak, nonatomic) IBOutlet MZDateTimeCollectionView *yearCollectionView;
@property (weak, nonatomic) IBOutlet MZDateTimeCollectionView *monthCollectionView;
@property (weak, nonatomic) IBOutlet MZDateTimeCollectionView *dayCollectionView;


@property (assign, nonatomic) NSUInteger startYear;
@property (assign, nonatomic) NSUInteger endYear;
@property (assign, nonatomic) NSIndexPath *currentYearIndexPath;
@property (assign, nonatomic) NSIndexPath *currentMonthIndexPath;
@property (assign, nonatomic) NSIndexPath *currentDayIndexPath;


@end
