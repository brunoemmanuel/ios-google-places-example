//
//  Api.m
//  Find Parking
//
//  Created by Bruno Rodrigues on 03/05/20.
//  Copyright © 2020 Bruno Rodrigues. All rights reserved.
//

#import "Api.h"
#import "Connection.h"
#import "Utils.h"

@implementation Api

-(NearbyParkingsResponse *) loadNearbyParkingsWithLocation:(Location *)location andRadius:(int)radius {
    if([[[NSProcessInfo processInfo] arguments] containsObject:@"UI-TESTING"]) {
        return [[NearbyParkingsResponse alloc] initWithDictionary:[Utils loadInfoPlistWithFileName:@"NearbyParkingsResponseMock"]];
    }
    
    NSString *query = [NSString stringWithFormat:@"/nearbysearch/json?location=%f,%f&radius=%i&type=parking",  location.latitude, location.longitude, radius];
    
    Connection *conn = [[Connection alloc] init];
    NSDictionary *requestResult = [conn requestWithMethod:@"GET" andQuery:query];
    
    NearbyParkingsResponse *response = [[NearbyParkingsResponse alloc] initWithDictionary:requestResult];

    return response;
}

- (ParkingDetailsResponse *) loadParkingDetailsWithPlaceId:(NSString *)placeId {
    if([[[NSProcessInfo processInfo] arguments] containsObject:@"UI-TESTING"]) {
        return [[ParkingDetailsResponse alloc] initWithDictionary:[Utils loadInfoPlistWithFileName:@"ParkingDetailsResponseMock"]];
    }
    
    NSString *query = [NSString stringWithFormat:@"/details/json?placeid=%@", placeId];
    
    Connection *conn = [[Connection alloc] init];
    NSDictionary *requestResult = [conn requestWithMethod:@"GET" andQuery:query];
    
    ParkingDetailsResponse *response = [[ParkingDetailsResponse alloc] initWithDictionary:requestResult];
    
    return response;
}

@end
