//
//  Utils.h
//  Find Parking
//
//  Created by Bruno Rodrigues on 01/05/20.
//  Copyright © 2020 Bruno Rodrigues. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>
#import "Location.h"

NS_ASSUME_NONNULL_BEGIN

@interface Utils : NSObject

+ (void)showAlertErrorWithError:(NSString *)errormessage andParent:(UIViewController *)viewController;
+ (int)distanceBetweenStartedLocation:(Location *)startedLocation andFinalLocation:(Location *)finalLocation;
+ (NSDictionary *)loadInfoPlistWithFileName:(NSString *)fileName;

@end

NS_ASSUME_NONNULL_END
