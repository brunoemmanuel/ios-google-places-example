//
//  NearbyParkingsResponse.h
//  Find Parking
//
//  Created by Bruno Rodrigues on 03/05/20.
//  Copyright © 2020 Bruno Rodrigues. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Parking.h"

NS_ASSUME_NONNULL_BEGIN

@interface NearbyParkingsResponse : NSObject

@property (nonatomic, strong) NSString *error;
@property (nonatomic, strong) NSArray<Parking *> *parkings;

- (instancetype)initWithDictionary:(NSDictionary *)dictionary;

@end

NS_ASSUME_NONNULL_END
