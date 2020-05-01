//
//  Connection.h
//  Find Parking
//
//  Created by Bruno Rodrigues on 01/05/20.
//  Copyright © 2020 Bruno Rodrigues. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Parking.h"

NS_ASSUME_NONNULL_BEGIN

@interface Connection : NSObject

-(NSArray<Parking *> *) loadNearbyParkingsWithLatitude:(float)latitude andLongitude:(float)longitude andRadius:(int)radius;

@end

NS_ASSUME_NONNULL_END
