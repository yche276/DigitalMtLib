//
//  ZendoMacros.h
//  DigitalMtLib
//
//  Created by Victor Chen on 7/10/13.
//  Copyright (c) 2013 Mt. Zendo Inc. All rights reserved.
//

#ifndef DigitalMtLib_ZendoMacros_h
#define DigitalMtLib_ZendoMacros_h

#define IS_IPAD   (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad)
#define IS_IPHONE (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPhone)
#define IS_IPHONE_5 (IS_IPHONE && [[UIScreen mainScreen] bounds].size.height == 568.0f)
#define IS_IPHONE_4 (IS_IPHONE && [[UIScreen mainScreen] bounds].size.height == 480.0f)

//iphone 6?


#endif
