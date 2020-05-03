//
//  DetailsViewModel.h
//  Find Parking
//
//  Created by Bruno Rodrigues on 02/05/20.
//  Copyright © 2020 Bruno Rodrigues. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <ReactiveCocoa/ReactiveCocoa.h>
#import "Location.h"

NS_ASSUME_NONNULL_BEGIN

@interface DetailsViewModel : NSObject


@property (nonatomic, readonly) RACSignal *nameUpdated;
@property (nonatomic, readonly) RACSignal *ratingUpdated;
@property (nonatomic, readonly) RACSignal *addressUpdated;
@property (nonatomic, readonly) RACSignal *websiteUpdated;
@property (nonatomic, readonly) RACSignal *phoneUpdated;
@property (nonatomic, readonly) RACSignal *locationUpdated;
@property (nonatomic, readonly) RACSignal *errorUpdated;

- (void)loadParkingDetailsWithPlaceId:(NSString *)placeId;
- (NSString *)parkingName;
- (NSString *)parkingRating;
- (NSString *)parkingAddress;
- (NSString *)parkingWebsite;
- (NSString *)parkingPhone;
- (Location *)parkingLocation;
- (NSString *)errorMessage;

@end

NS_ASSUME_NONNULL_END
