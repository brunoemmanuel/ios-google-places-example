//
//  Location.h
//  Find Parking
//
//  Created by Bruno Rodrigues on 01/05/20.
//  Copyright © 2020 Bruno Rodrigues. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface Location : NSObject

- (instancetype)initWithDictionary:(NSDictionary *)dictionary;

@property (nonatomic) float latitude;
@property (nonatomic) float longitude;

@end

NS_ASSUME_NONNULL_END
