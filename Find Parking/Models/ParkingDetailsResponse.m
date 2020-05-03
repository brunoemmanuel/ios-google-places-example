//
//  ParkingDetailsResponse.m
//  Find Parking
//
//  Created by Bruno Rodrigues on 03/05/20.
//  Copyright © 2020 Bruno Rodrigues. All rights reserved.
//

#import "ParkingDetailsResponse.h"

@implementation ParkingDetailsResponse

- (instancetype)initWithDictionary:(NSDictionary *)dictionary {
    self = [super init];
    if (!self) return nil;
    
    if(dictionary != nil) {
        if([dictionary objectForKey:@"errorMessage"]) {
            _error = [dictionary objectForKey:@"errorMessage"];
        } else {
            NSDictionary *temp = [dictionary objectForKey:@"result"];
            _parking = [[Parking alloc] initWithDictionary:temp];
        }
    }
    
    return self;
}

@end
