//
//  CoreDataUtilities.h

//
#import <CoreData/CoreData.h>
#import "NSManagedObject+Addition.h"

extern NSString* const MoreThanOneObjectException;

@interface NSManagedObjectContext (MtZendoCoreDataUtilities)

- (NSArray* ) objectsForEntityName:(NSString* )anEntity matchingKey:(NSString* )aKey andValue:(id)aValue;
- (NSManagedObject* ) objectForEntityName:(NSString* )anEntity matchingKey:(NSString* )aKey andValue:(id)aValue;
- (NSArray* ) allObjectsForEntityName:(NSString* )anEntity;

- (NSManagedObject *) firstObjectForEntityName:(NSString* ) anEntity;


@end
