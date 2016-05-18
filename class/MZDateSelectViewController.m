//
//  MZDateSelectViewController.m
//  DateSelector
//
//  Created by Chen Yue on 7/02/16.
//  Copyright © 2016 Chen Yue. All rights reserved.
//
#define mzcolor(prmRed, prmGreen, prmBlue, prmAlpha) [UIColor colorWithRed:(CGFloat)prmRed/255    \
                                green:(CGFloat)prmGreen/255  \
                                blue:(CGFloat)prmBlue/255   \
                                alpha:prmAlpha]             \

#define kPinkColor          mzcolor(224, 96, 108, 1.0f)

#import "MZDateSelectViewController.h"
#import "MZDateTimeCollectionViewCell.h"

static NSString *_yearCellIdentifier = @"YEAR_CELL";
static NSString *_monthCellIdentifier = @"MONTH_CELL";
static NSString *_dayCellIdentifier = @"DAY_CELL";

@interface MZDateSelectViewController () {
   
}
@property (nonatomic, assign) CGFloat labelFontSize;
@property (nonatomic, assign) CGFloat labelZoomScale;

//private methods
-(NSString*)shortMonthNameString:(NSUInteger)monthNumber;
-(NSString*)fullMonthNameString:(NSUInteger)monthNumber;

//Action Methods
-(IBAction)onBackBtn:(id)sender;
-(IBAction)onSelectBtn:(id)sender;
@end

@implementation MZDateSelectViewController

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    
    [self.yearCollectionView scrollToItemAtIndexPath:self.currentYearIndexPath
                                    atScrollPosition:UICollectionViewScrollPositionCenteredHorizontally
                                            animated:YES];
    [self.monthCollectionView scrollToItemAtIndexPath:self.currentMonthIndexPath
                                     atScrollPosition:UICollectionViewScrollPositionCenteredHorizontally
                                             animated:YES];
    [self.dayCollectionView scrollToItemAtIndexPath:self.currentDayIndexPath
                                   atScrollPosition:UICollectionViewScrollPositionCenteredHorizontally
                                           animated:YES];
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.view.backgroundColor = mzcolor(45, 55, 77, 1.0f);
//    self.navigationController.navigationBar.barStyle = UIStatusBarStyleLightContent; 
//    [self.navigationController.navigationBar setBarTintColor:mzcolor(45, 55, 77, 1.0f)];
    [self setNeedsStatusBarAppearanceUpdate];
    
    self.title = @"SELECT DATE";
    self.edgesForExtendedLayout = UIRectEdgeNone;
    self.automaticallyAdjustsScrollViewInsets = NO;
    
    
    UIButton *backBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    backBtn.frame = CGRectMake(0, 0, 60, 44);
    [backBtn setTitle:NSLocalizedString(@"Back", @"") forState:UIControlStateNormal];
    [backBtn.titleLabel setFont:[UIFont systemFontOfSize:15]];
    [backBtn setTitleColor:kPinkColor
                  forState:UIControlStateNormal];
    [backBtn addTarget:self action:@selector(onBackBtn:) forControlEvents:UIControlEventTouchUpInside];
    
    UIBarButtonItem *backButton = [[UIBarButtonItem alloc] initWithCustomView:backBtn];
    self.navigationItem.leftBarButtonItem = backButton;
    
    UIButton *selectBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    selectBtn.frame = CGRectMake(0, 0, 60, 44);
    [selectBtn setTitle:NSLocalizedString(@"Select", @"") forState:UIControlStateNormal];
    [selectBtn.titleLabel setFont:[UIFont systemFontOfSize:15]];
    [selectBtn setTitleColor:kPinkColor
                  forState:UIControlStateNormal];
    [selectBtn addTarget:self action:@selector(onSelectBtn:) forControlEvents:UIControlEventTouchUpInside];
    
    UIBarButtonItem *selectButton = [[UIBarButtonItem alloc] initWithCustomView:selectBtn];
    self.navigationItem.rightBarButtonItem = selectButton;
    
    self.startYear = 2000;
    self.endYear = 2050;

    self.labelFontSize = 12;
    self.labelZoomScale = 30;
    
    self.currentYearIndexPath = [NSIndexPath indexPathForRow:5 inSection:0];
    self.currentMonthIndexPath = [NSIndexPath indexPathForRow:1 inSection:0];
    self.currentDayIndexPath = [NSIndexPath indexPathForRow:2 inSection:0];
    
    self.yearCollectionView.titleLabel.text = @"Year";
    self.yearCollectionView.backgroundColor = [UIColor clearColor];
    self.yearCollectionView.baseLineColor = kPinkColor;
    self.yearCollectionView.decelerationRate = UIScrollViewDecelerationRateFast;
    [self.yearCollectionView registerClass:[MZDateTimeCollectionViewCell class]
                forCellWithReuseIdentifier:_yearCellIdentifier];
    
    self.monthCollectionView.titleLabel.text = @"Month";
    self.monthCollectionView.backgroundColor = [UIColor clearColor];
    self.monthCollectionView.baseLineColor = kPinkColor;
    self.monthCollectionView.decelerationRate = UIScrollViewDecelerationRateFast;
    [self.monthCollectionView registerClass:[MZDateTimeCollectionViewCell class]
                 forCellWithReuseIdentifier:_monthCellIdentifier];
    
    self.dayCollectionView.titleLabel.text = @"Day";
    self.dayCollectionView.backgroundColor = [UIColor clearColor];
    self.dayCollectionView.baseLineColor = kPinkColor;
    self.dayCollectionView.decelerationRate = UIScrollViewDecelerationRateFast;
    [self.dayCollectionView registerClass:[MZDateTimeCollectionViewCell class]
               forCellWithReuseIdentifier:_dayCellIdentifier];
    
}

- (UIStatusBarStyle)preferredStatusBarStyle
{
    return UIStatusBarStyleLightContent;
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

#pragma mark - Private Methods
-(NSString*)shortMonthNameString:(NSUInteger)monthNumber{
    NSDateFormatter *formate = [NSDateFormatter new];
    NSArray *monthNames = [formate shortMonthSymbols];
    NSString *monthName = [monthNames objectAtIndex:(monthNumber - 1)];
    return monthName;
}

-(NSString*)fullMonthNameString:(NSUInteger)monthNumber{
    NSDateFormatter *formate = [NSDateFormatter new];
    NSArray *monthNames = [formate monthSymbols];
    NSString *monthName = [monthNames objectAtIndex:(monthNumber - 1)];
    return monthName;
}

#pragma mark - Action Methods
-(IBAction)onBackBtn:(id)sender{
    [self.navigationController popViewControllerAnimated:YES];
}

-(IBAction)onSelectBtn:(id)sender{
    
}


#pragma mark - UICollectionViewDataSource
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    NSUInteger count = 0;
    
    if (collectionView == self.yearCollectionView) {
        count = self.endYear-self.startYear+1;
    }
    else if (collectionView == self.monthCollectionView){
        count = 12;
    }
    else if (collectionView == self.dayCollectionView){
        count = 30;
    }
    return count;
}

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    return 1;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
     
    MZDateTimeCollectionViewCell *cell = nil;
    
    if (collectionView == self.yearCollectionView) {
        cell = (MZDateTimeCollectionViewCell *)[collectionView dequeueReusableCellWithReuseIdentifier:_yearCellIdentifier
                                                                                         forIndexPath:indexPath];
        cell.titleLabel.text = [NSString stringWithFormat:@"%ld", self.startYear+indexPath.row];
//        if (indexPath == self.currentYearIndexPath) {
//            cell.titleLabel.textColor = kPinkColor;
//            
////            CGFloat distance = 1;
////            CGFloat zoomStep = cosf(M_PI_2*distance/cell.frame.size.width);
////            if (distance < cell.frame.size.width && distance > - cell.frame.size.width) {
////                float fontSize = self.labelFontSize + self.labelZoomScale * zoomStep;
////                cell.titleLabel.font = [cell.titleLabel.font fontWithSize:fontSize];
////            }
//        }
    }
    else if (collectionView == self.monthCollectionView){
        cell = (MZDateTimeCollectionViewCell *)[collectionView dequeueReusableCellWithReuseIdentifier:_monthCellIdentifier
                                                                                         forIndexPath:indexPath];
        cell.titleLabel.text = [NSString stringWithFormat:@"%@", [self fullMonthNameString:indexPath.row+1]];
//        if (indexPath == self.currentMonthIndexPath) {
//            cell.titleLabel.textColor = kPinkColor;
//        }
    }
    else if (collectionView == self.dayCollectionView){
        cell = (MZDateTimeCollectionViewCell *)[collectionView dequeueReusableCellWithReuseIdentifier:_dayCellIdentifier
                                                                                         forIndexPath:indexPath];
        
        cell.titleLabel.text = [NSString stringWithFormat:@"%ld", indexPath.row+1];
//        if (indexPath == self.currentDayIndexPath) {
//            cell.titleLabel.textColor = kPinkColor;
//        }
    }
    
    cell.titleLabel.font = [UIFont systemFontOfSize:self.labelFontSize];
    cell.lineColor = kPinkColor;
    [cell setNeedsDisplay];
    return cell;
    
    
    
}

#pragma mark - UICollectionViewDelegate
-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    if (collectionView == self.yearCollectionView) {
        [self.yearCollectionView scrollToItemAtIndexPath:indexPath
                                        atScrollPosition:UICollectionViewScrollPositionCenteredHorizontally
                                                animated:YES];
    }
    else if (collectionView == self.monthCollectionView) {
        [self.monthCollectionView scrollToItemAtIndexPath:indexPath
                                         atScrollPosition:UICollectionViewScrollPositionCenteredHorizontally
                                                 animated:YES];
    }
    else if (collectionView == self.dayCollectionView) {
        [self.dayCollectionView scrollToItemAtIndexPath:indexPath
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
        if (collectionView == self.yearCollectionView) {
            NSIndexPath *centerItemIndexPath = [self.yearCollectionView indexPathForItemAtPoint:center];
            
            if (centerItemIndexPath.row != self.currentYearIndexPath.row) {
                MZDateTimeCollectionViewCell *centerCell = (MZDateTimeCollectionViewCell *)[self.yearCollectionView cellForItemAtIndexPath:centerItemIndexPath];
                
                centerCell.titleLabel.textColor = kPinkColor;
                
                if (self.currentYearIndexPath) {
                    MZDateTimeCollectionViewCell *previousCenterCell = (MZDateTimeCollectionViewCell *)[self.yearCollectionView cellForItemAtIndexPath:self.currentYearIndexPath];
                    previousCenterCell.titleLabel.textColor = [UIColor whiteColor];
                }
                self.currentYearIndexPath = centerItemIndexPath;
            }
            MZDateTimeCollectionViewCell *centerCell = (MZDateTimeCollectionViewCell *)[self.yearCollectionView cellForItemAtIndexPath:self.currentYearIndexPath];
            CGFloat contentOffset = centerCell.center.x - (self.yearCollectionView.frame.size.width/2);
            [self.yearCollectionView setContentOffset:CGPointMake(contentOffset, self.yearCollectionView.contentOffset.y)
                                             animated:YES];
            
        }
        else if (collectionView == self.monthCollectionView) {
            NSIndexPath *centerItemIndexPath = [self.monthCollectionView indexPathForItemAtPoint:center];
            if (centerItemIndexPath.row != self.currentMonthIndexPath.row) {
                MZDateTimeCollectionViewCell *centerCell = (MZDateTimeCollectionViewCell *)[self.monthCollectionView cellForItemAtIndexPath:centerItemIndexPath];
                centerCell.titleLabel.textColor = kPinkColor;
                
                if (self.currentMonthIndexPath) {
                    MZDateTimeCollectionViewCell *previousCenterCell = (MZDateTimeCollectionViewCell *)[self.monthCollectionView cellForItemAtIndexPath:self.currentMonthIndexPath];
                    previousCenterCell.titleLabel.textColor = [UIColor whiteColor];
                }
                self.currentMonthIndexPath = centerItemIndexPath;
            }
            MZDateTimeCollectionViewCell *centerCell = (MZDateTimeCollectionViewCell *)[self.monthCollectionView cellForItemAtIndexPath:self.currentMonthIndexPath];
            CGFloat contentOffset = centerCell.center.x - (self.monthCollectionView.frame.size.width/2);
            [self.monthCollectionView setContentOffset:CGPointMake(contentOffset, self.monthCollectionView.contentOffset.y)
                                              animated:YES];
        }
        else if (collectionView == self.dayCollectionView) {
            NSIndexPath *centerItemIndexPath = [self.dayCollectionView indexPathForItemAtPoint:center];
            if (centerItemIndexPath.row != self.currentDayIndexPath.row) {
                MZDateTimeCollectionViewCell *centerCell = (MZDateTimeCollectionViewCell *)[self.dayCollectionView cellForItemAtIndexPath:centerItemIndexPath];
                centerCell.titleLabel.textColor = kPinkColor;
                
                if (self.currentDayIndexPath) {
                    MZDateTimeCollectionViewCell *previousCenterCell = (MZDateTimeCollectionViewCell *)[self.dayCollectionView cellForItemAtIndexPath:self.currentDayIndexPath];
                    previousCenterCell.titleLabel.textColor = [UIColor whiteColor];
                }
                self.currentDayIndexPath = centerItemIndexPath;
            }
            //go back to the current index path
            MZDateTimeCollectionViewCell *centerCell = (MZDateTimeCollectionViewCell *)[self.dayCollectionView cellForItemAtIndexPath:self.currentDayIndexPath];
            CGFloat contentOffset = centerCell.center.x - (self.dayCollectionView.frame.size.width/2);
            [self.dayCollectionView setContentOffset:CGPointMake(contentOffset, self.dayCollectionView.contentOffset.y)
                                            animated:YES];
            
        }
    }
    
    
    
    
    
}


@end







