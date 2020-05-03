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

-(NSArray<Parking *> *) loadNearbyParkingsWithLocation:(Location *)location andRadius:(int)radius {
    NSString *query = [NSString stringWithFormat:@"/nearbysearch/json?location=%f,%f&radius=%i&type=parking",  location.latitude, location.longitude, radius];
    
    Connection *conn = [[Connection alloc] init];
    NSDictionary *requestResult = [conn requestWithMethod:@"GET" andQuery:query];
    NSArray *tempArr = [requestResult objectForKey:@"results"];
    NSMutableArray *result = [[NSMutableArray alloc] init];
    
    for(NSDictionary * temp in tempArr) {
        Parking *parking = [[Parking alloc] initWithDictionary:temp];
        [parking setDistance:[Utils distanceBetweenStartedLocation:parking.location andFinalLocation: location]];
        [result addObject:parking];
    }

    return result;
}

- (Parking *) loadParkingDetailsWithPlaceId:(NSString *)placeId {
    NSString *query = [NSString stringWithFormat:@"/details/json?placeid=%@", placeId];
    
    Connection *conn = [[Connection alloc] init];
    NSDictionary *requestResult = [conn requestWithMethod:@"GET" andQuery:query];
    NSDictionary *temp = [requestResult objectForKey:@"result"];
    Parking *parking = [[Parking alloc] initWithDictionary:temp];
    
    return parking;
}

@end
