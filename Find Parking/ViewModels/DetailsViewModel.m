//
//  DetailsViewModel.m
//  Find Parking
//
//  Created by Bruno Rodrigues on 02/05/20.
//  Copyright © 2020 Bruno Rodrigues. All rights reserved.
//

#import "DetailsViewModel.h"
#import "Parking.h"
#import "Api.h"
#import "ParkingDetailsResponse.h"

@interface DetailsViewModel()

@property (nonatomic, strong) NSString *parkingName;
@property (nonatomic, strong) NSString *parkingRating;
@property (nonatomic, strong) NSString *parkingAddress;
@property (nonatomic, strong) NSString *parkingWebsite;
@property (nonatomic, strong) NSString *parkingPhone;
@property (nonatomic, strong) Location *parkingLocation;
@property (nonatomic, strong) NSString *errorMessage;

@end

@implementation DetailsViewModel

- (instancetype)init {
    self = [super init];
    if (!self) return nil;
    
    _nameUpdated = [RACObserve(self, parkingName) mapReplace:@(YES)];
    _ratingUpdated = [RACObserve(self, parkingRating) mapReplace:@(YES)];
    _addressUpdated = [RACObserve(self, parkingAddress) mapReplace:@(YES)];
    _websiteUpdated = [RACObserve(self, parkingWebsite) mapReplace:@(YES)];
    _phoneUpdated = [RACObserve(self, parkingPhone) mapReplace:@(YES)];
    _locationUpdated = [RACObserve(self, parkingLocation) mapReplace:@(YES)];
    _errorUpdated = [RACObserve(self, errorMessage) mapReplace:@(YES)];
    
    _parkingName = @"...";
    _parkingRating = @"...";
    _parkingAddress = @"...";
    _parkingWebsite = @"...";
    _parkingPhone = @"...";

    return self;
}

- (void)loadParkingDetailsWithPlaceId:(NSString *)placeId {
    ParkingDetailsResponse *result = [[Api alloc] loadParkingDetailsWithPlaceId:placeId];
    if(result.error != nil) {
        [self setErrorMessage:result.error];
    } else {
        Parking *parkingDetails = [result parking];
        
        if(parkingDetails.name != nil) {
            [self setParkingName:parkingDetails.name];
        }
        
        [self setParkingRating:[NSString stringWithFormat:@"%.01f", parkingDetails.rating]];
        
        if(parkingDetails.address != nil) {
            [self setParkingAddress:parkingDetails.address];
        }
        
        if(parkingDetails.website != nil) {
            [self setParkingWebsite:parkingDetails.website];
        }
        
        if(parkingDetails.phone != nil) {
            [self setParkingPhone:parkingDetails.phone];
        }
        
        if(parkingDetails.location != nil) {
            [self setParkingLocation:parkingDetails.location];
        }
    }
}

@end
