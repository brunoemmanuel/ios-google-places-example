//
//  Utils.h
//  Find Parking
//
//  Created by Bruno Rodrigues on 01/05/20.
//  Copyright © 2020 Bruno Rodrigues. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Location.h"

NS_ASSUME_NONNULL_BEGIN

@interface Utils : NSObject

+ (int)distanceBetweenStartedLocation:(Location *)startedLocation andFinalLocation:(Location *)finalLocation;

@end

NS_ASSUME_NONNULL_END
