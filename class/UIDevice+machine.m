//
//  UIDevice+machine.m
//  RainbowClock
//
//  Created by Victor Chen on 11/7/10.
//  Copyright (c) 2013 Mt. Zendo Inc. All rights reserved.
//

#import "UIDevice+machine.h"
#include <sys/types.h>
#include <sys/sysctl.h>

@implementation UIDevice(machine)
/*
 iPhone Simulator == i386
 iPhone == iPhone1,1
 3G iPhone == iPhone1,2
 3GS iPhone == iPhone2,1
 4 iPhone == iPhone3,1
 1st Gen iPod == iPod1,1
 2nd Gen iPod == iPod2,1
 3rd Gen iPod == iPod3,1
*/
- (NSString *)machine
{
	size_t size;
	
	// Set 'oldp' parameter to NULL to get the size of the data
	// returned so we can allocate appropriate amount of space
	sysctlbyname("hw.machine", NULL, &size, NULL, 0); 
	
	// Allocate the space to store name
	char *name = malloc(size);
	
	// Get the platform name
	sysctlbyname("hw.machine", name, &size, NULL, 0);
	
	// Place name into a string
	NSString *machine = [NSString stringWithUTF8String:name];
	
	// Done with this
	free(name);
	
	return machine;
}

@end
