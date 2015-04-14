//
//  NSManagedObject+Addition.m
//  MtZendoCalendar
//
//  Created by Victor Chen on 6/29/12.
//  Copyright (c) 2012 Mt. Zendo Inc. All rights reserved.
//

#import "NSManagedObject+Addition.h"

@implementation NSManagedObject (Addition)

+(NSSortDescriptor *)byIndexSortDescriptor {
    static NSSortDescriptor* s_indexSortDescriptor;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        s_indexSortDescriptor = [NSSortDescriptor sortDescriptorWithKey:@"index" ascending:YES];
    });
    return s_indexSortDescriptor;
}

@end
