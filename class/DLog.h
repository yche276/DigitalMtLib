/*
 *  DebugLog.h
 *  DebugLog
 *
 *  Created by Victor Chen on 3/22/09.
 *  Copyright (c) 2013 Mt. Zendo Inc. All rights reserved.
 *
 */

typedef enum : NSInteger
{
    LOG_INFO = 0,
    LOG_WARNING,
    LOG_ERROR,
    LOG_DEBUG
}LOG_LEVEL;


#ifdef DEBUG

# define DLog(level, args...) _DebugLog(level, __FILE__,__LINE__,__PRETTY_FUNCTION__,args);
//# define DLog(args...) _DebugLog(__FILE__,__LINE__,__PRETTY_FUNCTION__,args);
#else
# define DLog(x...)
#endif

#define DTrace DLog(@"")

void _DebugLog(LOG_LEVEL prmLevel, const char *file, int lineNumber, const char *funcName, NSString *format,...);
