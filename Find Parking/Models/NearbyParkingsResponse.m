//
//  NearbyParkingsResponse.m
//  Find Parking
//
//  Created by Bruno Rodrigues on 03/05/20.
//  Copyright © 2020 Bruno Rodrigues. All rights reserved.
//

#import "NearbyParkingsResponse.h"
#import "Utils.h"

@implementation NearbyParkingsResponse

- (instancetype)initWithDictionary:(NSDictionary *)dictionary {
    self = [super init];
    if (!self) return nil;
    
    if(dictionary != nil) {
        if([dictionary objectForKey:@"errorMessage"]) {
            _error = [dictionary objectForKey:@"errorMessage"];
        } else {
            NSArray *tempArr = [dictionary objectForKey:@"results"];
            NSMutableArray *result = [[NSMutableArray alloc] init];
            
            if(tempArr != nil) {
                for(NSDictionary * temp in tempArr) {
                    Parking *parking = [[Parking alloc] initWithDictionary:temp];
                    [result addObject:parking];
                }
            }
            
            _parkings = result;
        }
    }
    
    return self;
}

@end
