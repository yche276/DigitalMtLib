//
//  NSManagedObject+Addition.h
//  MtZendoCalendar
//
//  Created by Victor Chen on 6/29/12.
//  Copyright (c) 2012 Mt. Zendo Inc. All rights reserved.
//

#import <CoreData/CoreData.h>

@interface NSManagedObject (Addition)
+(NSSortDescriptor *)byIndexSortDescriptor;
@end
