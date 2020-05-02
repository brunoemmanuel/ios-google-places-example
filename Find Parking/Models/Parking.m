//
//  Parking.m
//  Find Parking
//
//  Created by Bruno Rodrigues on 01/05/20.
//  Copyright © 2020 Bruno Rodrigues. All rights reserved.
//

#import "Parking.h"

@implementation Parking

- (instancetype)initWithDictionary:(NSDictionary *)dictionary {
    self = [super init];
    if (!self) return nil;
    
    [self setName:[dictionary objectForKey:@"name"]];
    [self setPlaceId:[dictionary objectForKey:@"place_id"]];
    [self setRating:[[dictionary objectForKey:@"rating"] doubleValue]];
    [self setAddress:[dictionary objectForKey:@"formatted_address"]];
    [self setWebsite:[dictionary objectForKey:@"website"]];
    [self setPhone:[dictionary objectForKey:@"formatted_phone_number"]];
    
    if([dictionary objectForKey:@"geometry"] && [[dictionary objectForKey:@"geometry"] objectForKey:@"location"]) {
        [self setLocation:[[Location alloc] initWithDictionary:[[dictionary objectForKey:@"geometry"] objectForKey:@"location"]]];
    }
    
    return self;
}

@end
