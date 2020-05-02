//
//  DetailsViewModel.m
//  Find Parking
//
//  Created by Bruno Rodrigues on 02/05/20.
//  Copyright © 2020 Bruno Rodrigues. All rights reserved.
//

#import "DetailsViewModel.h"
#import "Parking.h"
#import "Connection.h"

@interface DetailsViewModel()

@end

@implementation DetailsViewModel

- (instancetype)init {
    self = [super init];
    if (!self) return nil;

    _rating = @"...";
    _address = @"...";
    _website = @"...";
    _phone = @"...";

    return self;
}

- (void)loadParkingDetailsWithPlaceId:(NSString *)placeId {
    Parking *parkingDetails = [[Connection alloc] loadParkingDetailsWithPlaceId:placeId];
    
    [self setRating:[NSString stringWithFormat:@"%.01f", parkingDetails.rating]];
    
    if(parkingDetails.address != nil) {
        [self setAddress:parkingDetails.address];
    }
    
    if(parkingDetails.address != nil) {
        [self setAddress:parkingDetails.address];
    }
    
    if(parkingDetails.website != nil) {
        [self setWebsite:parkingDetails.website];
    }
    
    if(parkingDetails.phone != nil) {
        [self setPhone:parkingDetails.phone];
    }
}

@end
