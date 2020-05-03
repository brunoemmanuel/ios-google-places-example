//
//  Connection.m
//  Find Parking
//
//  Created by Bruno Rodrigues on 01/05/20.
//  Copyright © 2020 Bruno Rodrigues. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Connection.h"
#import "Utils.h"

#define API_KEY @"AIzaSyAww7mo50bhnPLbMTD2Yx8qEYNbR973j9A"
#define BASE_URL @"https://maps.googleapis.com/maps/api/place"

@implementation Connection

-(NSDictionary *) requestWithMethod:(NSString *)method andQuery:(NSString *)query {
    NSMutableURLRequest *request = [[NSMutableURLRequest alloc] init];
    [request setHTTPMethod:method];
    NSString *url = [NSString stringWithFormat:@"%@%@&key=%@", BASE_URL, query, API_KEY];
    
    [request setURL:[NSURL URLWithString:url]];
    
    NSError *error = nil;
    NSHTTPURLResponse *responseCode = nil;

    NSData *oResponseData = [NSURLConnection sendSynchronousRequest:request returningResponse:&responseCode error:&error];

    if([responseCode statusCode] != 200){
        NSLog(@"Error getting %@, HTTP status code %li", url, (long)[responseCode statusCode]);
        return nil;
    }
    
    NSDictionary *result = [NSJSONSerialization JSONObjectWithData:oResponseData options:0 error:nil];
    
    return result;
}

@end
