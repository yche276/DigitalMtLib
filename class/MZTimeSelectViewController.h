//
//  MZTimeSelectViewController.h
//  DateSelector
//
//  Created by Chen Yue on 8/02/16.
//  Copyright © 2016 Chen Yue. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MZDateTimeCollectionView.h"
#import "MZDateTimeCollectionViewCell.h"

@interface MZTimeSelectViewController : UIViewController {
    
}
@property (weak, nonatomic) IBOutlet MZDateTimeCollectionView *hourCollectionView;
@property (weak, nonatomic) IBOutlet MZDateTimeCollectionView *minutesCollectionView;


@property (assign, nonatomic) NSIndexPath *currentHourIndexPath;
@property (assign, nonatomic) NSIndexPath *currentMinuteIndexPath;
@end
