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

@property (nonatomic, strong) NSString *name;
@property (nonatomic, strong) NSString *rating;
@property (nonatomic, strong) NSString *address;
@property (nonatomic, strong) NSString *website;
@property (nonatomic, strong) NSString *phone;
@property (nonatomic, strong) Location *location;


@end

@implementation DetailsViewModel

- (instancetype)init {
    self = [super init];
    if (!self) return nil;
    
    _nameUpdated = [RACObserve(self, name) mapReplace:@(YES)];
    _ratingUpdated = [RACObserve(self, rating) mapReplace:@(YES)];
    _addressUpdated = [RACObserve(self, address) mapReplace:@(YES)];
    _websiteUpdated = [RACObserve(self, website) mapReplace:@(YES)];
    _phoneUpdated = [RACObserve(self, phone) mapReplace:@(YES)];
    _locationUpdated = [RACObserve(self, location) mapReplace:@(YES)];
    
    _name = @"...";
    _rating = @"...";
    _address = @"...";
    _website = @"...";
    _phone = @"...";

    return self;
}

- (void)loadParkingDetailsWithPlaceId:(NSString *)placeId {
    Parking *parkingDetails = [[Connection alloc] loadParkingDetailsWithPlaceId:placeId];
    
    if(parkingDetails.name != nil) {
        [self setName:parkingDetails.name];
    }
    
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
    
    if(parkingDetails.location != nil) {
        [self setLocation:parkingDetails.location];
    }
}

- (NSString *)parkingName {
    return _name;
}

- (NSString *)parkingRating {
    return _rating;
}

- (NSString *)parkingAddress {
    return _address;
}

- (NSString *)parkingWebsite {
    return _website;
}

- (NSString *)parkingPhone {
    return _phone;
}

- (Location *)parkingLocation {
    return _location;
}

@end
