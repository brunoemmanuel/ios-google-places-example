//
//  Location.m
//  Find Parking
//
//  Created by Bruno Rodrigues on 01/05/20.
//  Copyright © 2020 Bruno Rodrigues. All rights reserved.
//

#import "Location.h"

@implementation Location

- (instancetype)initWithDictionary:(NSDictionary *)dictionary {
    self = [super init];
    if (!self) return nil;
    
    [self setLatitude:[[dictionary objectForKey:@"lat"] floatValue]];
    [self setLongitude:[[dictionary objectForKey:@"lng"] floatValue]];
    
    return self;
}

@end
