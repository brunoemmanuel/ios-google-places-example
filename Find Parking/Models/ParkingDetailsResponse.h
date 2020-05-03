//
//  ParkingDetailsResponse.h
//  Find Parking
//
//  Created by Bruno Rodrigues on 03/05/20.
//  Copyright © 2020 Bruno Rodrigues. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Parking.h"

NS_ASSUME_NONNULL_BEGIN

@interface ParkingDetailsResponse : NSObject

@property (nonatomic, strong) NSString *error;
@property (nonatomic, strong) Parking *parking;

- (instancetype)initWithDictionary:(NSDictionary *)dictionary;

@end

NS_ASSUME_NONNULL_END
