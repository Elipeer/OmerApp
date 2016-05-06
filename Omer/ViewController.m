//
//  ViewController.m
//  Omer
//
//  Created by Eli Peer on 5/3/16.
//  Copyright © 2016 elipeer. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController
@synthesize locationManager;

- (void)locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray *)locations {
    CLLocation* loc = [locations lastObject]; // locations is guaranteed to have at least one object
    float latitude = loc.coordinate.latitude;
    float longitude = loc.coordinate.longitude;
    NSLog(@"%.8f",latitude);
    NSLog(@"%.8f",longitude);
    
    NSLog(@"workes");
    [locationManager stopUpdatingLocation];
}



- (void)viewDidLoad {
    self.locationManager = [[CLLocationManager alloc] init];
    self.locationManager.delegate = self;
    self.locationManager.desiredAccuracy = kCLLocationAccuracyBest;
    self.locationManager.distanceFilter = kCLDistanceFilterNone;
    [self.locationManager startUpdatingLocation];
    [locationManager requestAlwaysAuthorization];
    float latitude = locationManager.location.coordinate.latitude;
    float longitude = locationManager.location.coordinate.longitude;
    

    NSString *lati = [NSString stringWithFormat: @"%f", latitude];

    
    label3.text = lati;
    
    

    
    NSTimeZone *timeZone = [NSTimeZone localTimeZone];
    
    KCGeoLocation *location = [[KCGeoLocation alloc] initWithLatitude:latitude andLongitude:longitude andTimeZone:timeZone];
    KCAstronomicalCalendar *calendar = [[KCAstronomicalCalendar alloc] initWithLocation:location];
    
    NSDateFormatter *format = [[NSDateFormatter alloc] init];
    [format setDateFormat:@"MMMM dd, yyyy (EEEE) h:mm:ss a z Z"];
    NSDate *now = [calendar sunset];
    
    NSLog(@"sunset: %@", now);
    NSString *nsstr = [format stringFromDate:now];

    label1.text =nsstr;
    


    
    
    
    NSDate *today = [NSDate date];
   NSInteger dayOfSefira = [KCSefiratHaomerCalculator dayOfSefiraForDate:today];
    NSString *inStr = [NSString stringWithFormat: @"%ld", (long)dayOfSefira];
    
    
 
    
    

     NSLog(@"dos: %ld", (long)dayOfSefira);
    
    label.text = [NSString stringWithFormat:@"Day Of Sefira: %@", inStr];
    
    
    
    
    //Replace the methods below with your required method name.
    if ([locationManager respondsToSelector:@selector(requestWhenInUseAuthorization)]) {
        [locationManager requestWhenInUseAuthorization];
        
    }

    
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}




- (IBAction)Button:(id)sender{


   

    
}







- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
@end
