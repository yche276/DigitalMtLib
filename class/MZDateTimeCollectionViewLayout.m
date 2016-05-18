//
//  MZDateTimeCollectionViewLayout.m
//  Clock
//
//  Created by Victor Chen on 1/29/16.
//  Copyright © 2016 Chen Yue. All rights reserved.
//

#import "MZDateTimeCollectionViewLayout.h"




static NSString * const _cellType = @"CELL_TYPE";


@interface MZDateTimeCollectionViewLayout () {
    
}

@property (nonatomic, strong) NSDictionary *layoutInfo;
@property (nonatomic, assign) NSUInteger offsetX;



@end

@implementation MZDateTimeCollectionViewLayout

#pragma mark - Lifecycle

- (id)init
{
    self = [super init];
    if (self) {
        
    }
    return self;
}

- (id)initWithCoder:(NSCoder *)aDecoder
{
    self = [super init];
    if (self) {
        
        
    }
    
    return self;
}

- (void)setup
{
    //there is only one line in the collection view,
    //so the number of items in the section will be the number of column of the section
    self.interItemSpacingY = 0.0f;
    self.interItemSpacingX = 0.0f;
    
    
    
    CGFloat width = 100;
    CGFloat height = self.collectionView.frame.size.height;
    
    self.itemSize = (CGSize){width, height};
    
    
    float top = self.interItemSpacingX;
    float left = 0;
    float bottom = 0.0f;
    float right = left;
    
    self.itemInsets = UIEdgeInsetsMake(top, left, bottom, right);
    
    self.offsetX = (self.collectionView.frame.size.width/2)-(self.itemSize.width/2);
    
    
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(orientationChanged:)
                                                 name:UIDeviceOrientationDidChangeNotification
                                               object:nil];
    
}


#pragma mark - Layout
- (void)prepareLayout {

    if (!self.layoutInfo) {
        [self setup];
        NSMutableDictionary *newLayoutInfo = [NSMutableDictionary dictionary];
        NSMutableDictionary *cellLayoutInfo = [NSMutableDictionary dictionary];
        
        NSInteger sectionCount = [self.collectionView numberOfSections];
        NSIndexPath *indexPath = [NSIndexPath indexPathForItem:0 inSection:0];
        
        for (NSInteger section = 0; section < sectionCount; section++) {
            NSInteger itemCount = [self.collectionView numberOfItemsInSection:section];
            for (NSInteger item = 0; item < itemCount; item++) {
                indexPath = [NSIndexPath indexPathForItem:item inSection:section];
                
                UICollectionViewLayoutAttributes *itemAttributes = [UICollectionViewLayoutAttributes layoutAttributesForCellWithIndexPath:indexPath];
                itemAttributes.frame = [self frameForCellAtIndexPath:indexPath];
                
                cellLayoutInfo[indexPath] = itemAttributes;
            }
        }
        
        newLayoutInfo[_cellType] = cellLayoutInfo;
        
        self.layoutInfo = newLayoutInfo;
    }
    
    
}

- (NSArray *)layoutAttributesForElementsInRect:(CGRect)rect
{
    NSMutableArray *allAttributes = [NSMutableArray arrayWithCapacity:self.layoutInfo.count];
    
    [self.layoutInfo enumerateKeysAndObjectsUsingBlock:^(NSString *elementIdentifier,
                                                         NSDictionary *elementsInfo,
                                                         BOOL *stop) {
        [elementsInfo enumerateKeysAndObjectsUsingBlock:^(NSIndexPath *indexPath,
                                                          UICollectionViewLayoutAttributes *attributes,
                                                          BOOL *innerStop) {
            if (CGRectIntersectsRect(rect, attributes.frame)) {
                [allAttributes addObject:attributes];
            }
        }];
    }];
    
    return allAttributes;
}

- (UICollectionViewLayoutAttributes *)layoutAttributesForItemAtIndexPath:(NSIndexPath *)indexPath
{
    return self.layoutInfo[_cellType][indexPath];
}

- (CGSize)collectionViewContentSize
{
    NSInteger sum = [self.collectionView numberOfItemsInSection:0];
    return CGSizeMake((self.itemSize.width*sum)+(2*self.offsetX), self.collectionView.frame.size.height);
}

- (BOOL)shouldInvalidateLayoutForBoundsChange:(CGRect)newBounds
{
    
    return YES;
}

#pragma mark - Private
- (CGRect)frameForCellAtIndexPath:(NSIndexPath *)indexPath
{
    return CGRectMake(self.offsetX+(self.itemSize.width*indexPath.row), 0, self.itemSize.width, self.itemSize.height);
}


#pragma mark - Properties

- (void)setItemInsets:(UIEdgeInsets)itemInsets
{
    if (UIEdgeInsetsEqualToEdgeInsets(_itemInsets, itemInsets)) return;
    
    _itemInsets = itemInsets;
    
    [self invalidateLayout];
}

- (void)setItemSize:(CGSize)itemSize
{
    if (CGSizeEqualToSize(_itemSize, itemSize)) return;
    
    _itemSize = itemSize;
    
    [self invalidateLayout];
}

- (void)setInterItemSpacingY:(CGFloat)interItemSpacingY
{
    if (_interItemSpacingY == interItemSpacingY) return;
    
    _interItemSpacingY = interItemSpacingY;
    
    [self invalidateLayout];
}

- (void)setNumberOfColumns:(NSInteger)numberOfColumns
{
    if (_numberOfColumns == numberOfColumns) return;
    
    _numberOfColumns = numberOfColumns;
    
    [self invalidateLayout];
}

#pragma mark - Notificaion
- (void)orientationChanged:(NSNotification *)notification{
    self.layoutInfo = nil;
    [self invalidateLayout];
}
@end
