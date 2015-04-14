//
//  CoreDataUtilities.m

//

#import "CoreDataUtilities.h"

NSString* const MoreThanOneObjectException = @"MoreThanOneObjectException";

@implementation NSManagedObjectContext (CoreDataUtilities)

- (NSArray* )objectsForEntityName:(NSString* )anEntity matchingKey:(NSString* )aKey andValue:(id)aValue {
    NSPredicate* pred = [NSPredicate predicateWithFormat:@"%K == %@", aKey, aValue];
    NSFetchRequest* fr = [[NSFetchRequest alloc] init];
    [fr setEntity:[NSEntityDescription entityForName:anEntity inManagedObjectContext:self]];
    [fr setPredicate: pred];
    
    NSArray* results = nil;
    NSError* anyError = nil;
    
    results = [self executeFetchRequest:fr error:&anyError];
    
    return results;
}

-(NSManagedObject *)objectForEntityName:(NSString *)anEntity matchingKey:(NSString *)aKey andValue:(id)aValue {
    NSArray* results = [self objectsForEntityName:anEntity matchingKey:aKey andValue:aValue];
    if ([results count] > 1) {
        // raise the moreThanOneException
        //[NSException raise:MoreThanOneObjectException format:@"More than one object returned for fetch <%@: %@ = %@>", anEntity, aKey, aValue, nil];
    }
    
    NSManagedObject* returnValue = ([results count] == 1) ? (NSManagedObject* )[results objectAtIndex:0] : nil;
    
    return returnValue;
}

- (NSArray* ) allObjectsForEntityName:(NSString* ) anEntity {
    NSArray *fetchedObjects = nil;
    @try {
        NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] init];
        NSEntityDescription *entity = [NSEntityDescription entityForName:anEntity
                                                  inManagedObjectContext:self];
        [fetchRequest setEntity:entity];
    
        NSError *error = nil;
        fetchedObjects = [self executeFetchRequest:fetchRequest error:&error];
        if( fetchedObjects == nil || (error) ) {
            fetchedObjects = [NSArray array];
        }
    }
    @catch (NSException *exception) {
        NSLog(@"%@", exception.description);
    }
    
	return fetchedObjects;
}


- (NSManagedObject *) firstObjectForEntityName:(NSString* ) anEntity {
    
    NSFetchRequest* fr = [[NSFetchRequest alloc] init];
    [fr setEntity:[NSEntityDescription entityForName:anEntity inManagedObjectContext:self]];
    [fr setFetchLimit:1];
    
    NSArray* results = nil;
    NSError* anyError = nil;
    results = [self executeFetchRequest:fr error:&anyError];
    
    if (anyError != nil) {
        
        NSLog(@"Error = %@", anyError.description);
        return nil;
    }
    
    return [results firstObject];
    
    
}


@end
