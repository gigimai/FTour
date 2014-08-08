//
//  PersistencyManager.h
//  FTour
//
//  Created by Tuan An on 04/08/2014.
//  Copyright (c) Năm 2014 FSoft. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Contact.h"
#import "Food.h"

@interface PersistencyManager : NSObject
- (NSMutableDictionary*)getContacts;
- (NSMutableDictionary*)getDishes;
@end
