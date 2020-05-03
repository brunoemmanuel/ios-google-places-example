//
//  Api.h
//  Find Parking
//
//  Created by Bruno Rodrigues on 03/05/20.
//  Copyright © 2020 Bruno Rodrigues. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Parking.h"
#import "Location.h"

NS_ASSUME_NONNULL_BEGIN

@interface Api : NSObject

- (NSArray<Parking *> *) loadNearbyParkingsWithLocation:(Location *)location andRadius:(int)radius;
- (Parking *) loadParkingDetailsWithPlaceId:(NSString *)placeId;

@end

NS_ASSUME_NONNULL_END
