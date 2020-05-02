//
//  DetailsViewController.h
//  Find Parking
//
//  Created by Bruno Rodrigues on 02/05/20.
//  Copyright © 2020 Bruno Rodrigues. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>
#import "Parking.h"

NS_ASSUME_NONNULL_BEGIN

@interface DetailsViewController : UIViewController

@property (weak, nonatomic) IBOutlet MKMapView * mapView;
@property (weak, nonatomic) IBOutlet UILabel *labelName;
@property (weak, nonatomic) IBOutlet UILabel *labelRating;
@property (weak, nonatomic) IBOutlet UILabel *labelAddress;
@property (weak, nonatomic) IBOutlet UILabel *labelUrl;
@property (weak, nonatomic) IBOutlet UILabel *labelPhone;

@property (strong, nonatomic) Parking *parking;

- (IBAction)back:(UIBarButtonItem *)sender;

@end

NS_ASSUME_NONNULL_END
