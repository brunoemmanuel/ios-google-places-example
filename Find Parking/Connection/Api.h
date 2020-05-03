//
//  Api.h
//  Find Parking
//
//  Created by Bruno Rodrigues on 03/05/20.
//  Copyright © 2020 Bruno Rodrigues. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Location.h"
#import "NearbyParkingsResponse.h"
#import "ParkingDetailsResponse.h"

NS_ASSUME_NONNULL_BEGIN

@interface Api : NSObject

- (NearbyParkingsResponse *) loadNearbyParkingsWithLocation:(Location *)location andRadius:(int)radius;
- (ParkingDetailsResponse *) loadParkingDetailsWithPlaceId:(NSString *)placeId;

@end

NS_ASSUME_NONNULL_END
