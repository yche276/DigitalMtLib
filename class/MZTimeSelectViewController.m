//
//  MZTimeSelectViewController.m
//  DateSelector
//
//  Created by Chen Yue on 8/02/16.
//  Copyright © 2016 Chen Yue. All rights reserved.
//

#import "MZTimeSelectViewController.h"

#define mzcolor(prmRed, prmGreen, prmBlue, prmAlpha) [UIColor colorWithRed:(CGFloat)prmRed/255    \
green:(CGFloat)prmGreen/255  \
blue:(CGFloat)prmBlue/255   \
alpha:prmAlpha]             \

#define kPinkColor          mzcolor(224, 96, 108, 1.0f)

static NSString *_hourCellIdentifier = @"HOUR_CELL";
static NSString *_minutehCellIdentifier = @"MINUTE_CELL";

@interface MZTimeSelectViewController () {
    
}
@property (nonatomic, assign) CGFloat labelFontSize;
@property (nonatomic, assign) CGFloat labelZoomScale;

@end

@implementation MZTimeSelectViewController

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    
    [self.hourCollectionView scrollToItemAtIndexPath:self.currentHourIndexPath
                                    atScrollPosition:UICollectionViewScrollPositionCenteredHorizontally
                                            animated:YES];
    [self.minutesCollectionView scrollToItemAtIndexPath:self.currentMinuteIndexPath
                                       atScrollPosition:UICollectionViewScrollPositionCenteredHorizontally
                                               animated:YES];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.view.backgroundColor = mzcolor(45, 55, 77, 1.0f);
    
    self.title = @"SELECT TIME";
    self.edgesForExtendedLayout = UIRectEdgeNone;
    self.automaticallyAdjustsScrollViewInsets = NO;
    
    self.labelFontSize = 15;
    self.labelZoomScale = 35;
    
    self.currentHourIndexPath = [NSIndexPath indexPathForRow:5 inSection:0];
    self.currentMinuteIndexPath = [NSIndexPath indexPathForRow:1 inSection:0];
    
    self.hourCollectionView.titleLabel.text = @"Hour";
    self.hourCollectionView.backgroundColor = [UIColor clearColor];
    self.hourCollectionView.baseLineColor = kPinkColor;
    self.hourCollectionView.decelerationRate = UIScrollViewDecelerationRateFast;
    [self.hourCollectionView registerClass:[MZDateTimeCollectionViewCell class]
                forCellWithReuseIdentifier:_hourCellIdentifier];
    
    self.minutesCollectionView.titleLabel.text = @"Minute";
    self.minutesCollectionView.backgroundColor = [UIColor clearColor];
    self.minutesCollectionView.baseLineColor = kPinkColor;
    self.minutesCollectionView.decelerationRate = UIScrollViewDecelerationRateFast;
    [self.minutesCollectionView registerClass:[MZDateTimeCollectionViewCell class]
                   forCellWithReuseIdentifier:_minutehCellIdentifier];
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

#pragma mark - UICollectionViewDataSource
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    NSUInteger count = 0;
    
    if (collectionView == self.hourCollectionView) {
        count = 12;
    }
    else if (collectionView == self.minutesCollectionView){
        count = 60;
    }
    return count;
}

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    return 1;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    MZDateTimeCollectionViewCell *cell = nil;
    
    
    if (collectionView == self.hourCollectionView) {
        cell = (MZDateTimeCollectionViewCell *)[collectionView dequeueReusableCellWithReuseIdentifier:_hourCellIdentifier
                                                                                         forIndexPath:indexPath];
        cell.titleLabel.text = [NSString stringWithFormat:@"%ld", indexPath.row+1];

    }
    else if (collectionView == self.minutesCollectionView){
        cell = (MZDateTimeCollectionViewCell *)[collectionView dequeueReusableCellWithReuseIdentifier:_minutehCellIdentifier
                                                                                         forIndexPath:indexPath];
        cell.titleLabel.text = [NSString stringWithFormat:@"%ld", indexPath.row+1];
      
    }
    cell.titleLabel.font = [UIFont systemFontOfSize:self.labelFontSize];
    cell.lineColor = kPinkColor;
    [cell setNeedsDisplay];
    return cell;
}

#pragma mark - UICollectionViewDelegate
-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    if (collectionView == self.hourCollectionView) {
        [self.hourCollectionView scrollToItemAtIndexPath:indexPath
                                        atScrollPosition:UICollectionViewScrollPositionCenteredHorizontally
                                                animated:YES];
    }
    else if (collectionView == self.minutesCollectionView) {
        [self.minutesCollectionView scrollToItemAtIndexPath:indexPath
                                           atScrollPosition:UICollectionViewScrollPositionCenteredHorizontally
                                                   animated:YES];
    }
    
}

#pragma mark - ScrollView Delegate
-(void)scrollViewDidScroll:(UIScrollView *)scrollView{
    
    CGPoint centerScrollViewPoint = CGPointMake(scrollView.frame.size.width/2, scrollView.frame.size.height/2);
    CGPoint center = CGPointMake(scrollView.contentOffset.x+centerScrollViewPoint.x, centerScrollViewPoint.y);
    
    [scrollView.subviews enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
        
        if ([obj isKindOfClass:[MZDateTimeCollectionViewCell class]]) {
            MZDateTimeCollectionViewCell *cell = (MZDateTimeCollectionViewCell *)obj;
            @autoreleasepool {
                // Distance between cell center point and center of tableView
                CGFloat distance = cell.center.x - center.x;
                // Zoom step using cosinus
                CGFloat zoomStep = cosf(M_PI_2*distance/cell.frame.size.width);
                if (distance < cell.frame.size.width && distance > - cell.frame.size.width) {
                    float fontSize = self.labelFontSize + self.labelZoomScale * zoomStep;
                    cell.titleLabel.font = [cell.titleLabel.font fontWithSize:fontSize];
                    cell.titleLabel.textColor = kPinkColor;
                    
                } else {
                    cell.titleLabel.font = [cell.titleLabel.font fontWithSize:self.labelFontSize];
                    cell.titleLabel.textColor = [UIColor whiteColor];
                }
            }//end auto release pool
        }
    }];//end block
    
    
}

-(void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate{
    if(!decelerate) {
        [self scrollViewDidFinishScrolling:scrollView];
    }
}

-(void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView{
    [self scrollViewDidFinishScrolling:scrollView];
}


- (void)scrollViewDidFinishScrolling:(UIScrollView*)scrollView {
    
    CGPoint centerScrollViewPoint = CGPointMake(scrollView.frame.size.width/2, scrollView.frame.size.height/2);
    CGPoint center = CGPointMake(scrollView.contentOffset.x+centerScrollViewPoint.x, centerScrollViewPoint.y);
    
    
    
    if ([scrollView isKindOfClass:[MZDateTimeCollectionView class]]) {
        MZDateTimeCollectionView *collectionView = (MZDateTimeCollectionView *)scrollView;
        if (collectionView == self.hourCollectionView) {
            NSIndexPath *centerItemIndexPath = [self.hourCollectionView indexPathForItemAtPoint:center];
            
            if (centerItemIndexPath.row != self.currentHourIndexPath.row) {
                MZDateTimeCollectionViewCell *centerCell = (MZDateTimeCollectionViewCell *)[self.hourCollectionView cellForItemAtIndexPath:centerItemIndexPath];
                
                centerCell.titleLabel.textColor = kPinkColor;
                
                if (self.currentHourIndexPath) {
                    MZDateTimeCollectionViewCell *previousCenterCell = (MZDateTimeCollectionViewCell *)[self.hourCollectionView cellForItemAtIndexPath:self.currentHourIndexPath];
                    previousCenterCell.titleLabel.textColor = [UIColor whiteColor];
                }
                self.currentHourIndexPath = centerItemIndexPath;
            }
            MZDateTimeCollectionViewCell *centerCell = (MZDateTimeCollectionViewCell *)[self.hourCollectionView cellForItemAtIndexPath:self.currentHourIndexPath];
            CGFloat contentOffset = centerCell.center.x - (self.hourCollectionView.frame.size.width/2);
            [self.hourCollectionView setContentOffset:CGPointMake(contentOffset, self.hourCollectionView.contentOffset.y)
                                             animated:YES];
            
        }
        else if (collectionView == self.minutesCollectionView) {
            NSIndexPath *centerItemIndexPath = [self.minutesCollectionView indexPathForItemAtPoint:center];
            if (centerItemIndexPath.row != self.currentMinuteIndexPath.row) {
                MZDateTimeCollectionViewCell *centerCell = (MZDateTimeCollectionViewCell *)[self.minutesCollectionView cellForItemAtIndexPath:centerItemIndexPath];
                centerCell.titleLabel.textColor = kPinkColor;
                
                if (self.currentMinuteIndexPath) {
                    MZDateTimeCollectionViewCell *previousCenterCell = (MZDateTimeCollectionViewCell *)[self.minutesCollectionView cellForItemAtIndexPath:self.currentMinuteIndexPath];
                    previousCenterCell.titleLabel.textColor = [UIColor whiteColor];
                }
                self.currentMinuteIndexPath = centerItemIndexPath;
            }
            MZDateTimeCollectionViewCell *centerCell = (MZDateTimeCollectionViewCell *)[self.minutesCollectionView cellForItemAtIndexPath:self.currentMinuteIndexPath];
            CGFloat contentOffset = centerCell.center.x - (self.minutesCollectionView.frame.size.width/2);
            [self.minutesCollectionView setContentOffset:CGPointMake(contentOffset, self.minutesCollectionView.contentOffset.y)
                                              animated:YES];
        }
    }
    
}


@end
