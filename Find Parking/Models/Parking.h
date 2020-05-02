//
//  Parking.h
//  Find Parking
//
//  Created by Bruno Rodrigues on 01/05/20.
//  Copyright © 2020 Bruno Rodrigues. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Location.h"

NS_ASSUME_NONNULL_BEGIN

@interface Parking : NSObject

- (instancetype)initWithDictionary:(NSDictionary *)dictionary;

@property (nonatomic, strong) NSString *name;
@property (nonatomic, strong) NSString *placeId;
@property (nonatomic, strong) Location *location;

@end

NS_ASSUME_NONNULL_END
