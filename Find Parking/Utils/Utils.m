//
//  Utils.m
//  Find Parking
//
//  Created by Bruno Rodrigues on 01/05/20.
//  Copyright © 2020 Bruno Rodrigues. All rights reserved.
//

#import "Utils.h"
#import <math.h>

@implementation Utils

+ (void)showAlertErrorWithError:(NSString *)errormessage andParent:(UIViewController *)viewController {
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"Attention!" message:errormessage preferredStyle: UIAlertControllerStyleAlert];
    
    UIAlertAction *action = [UIAlertAction actionWithTitle:@"Dismiss" style:UIAlertActionStyleDefault handler: ^ (UIAlertAction * _Nonnull action) {
        NSLog(@ "Dismiss Tapped");
    }];
    
    [alert addAction:action];
    [viewController  presentViewController:alert animated:true completion:nil];
}

+ (int)distanceBetweenStartedLocation:(Location *)startedLocation andFinalLocation:(Location *)finalLocation {
    int R = 6371e3;
    
    float lat1 = startedLocation.latitude * M_PI / 180;
    float lat2 = finalLocation.latitude * M_PI / 180;
    float deltaLat = (finalLocation.latitude - startedLocation.latitude) * M_PI / 180;
    float deltaLon = (finalLocation.longitude - startedLocation.longitude) * M_PI / 180;
    
    float a = (sin(deltaLat / 2) * sin(deltaLat / 2)) + (cos(lat1) * cos(lat2)) * (sin(deltaLon / 2) * sin(deltaLon / 2));
    float c = 2 * atan2(sqrt(a), sqrt(1 - a));
    int d = R * c;
    
    return d;
}

@end
