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
    [self HebrewDay];
    [self theMagicDate];
    
    
    self.locationManager = [[CLLocationManager alloc] init];
    self.locationManager.delegate = self;
    self.locationManager.desiredAccuracy = kCLLocationAccuracyBest;
    self.locationManager.distanceFilter = kCLDistanceFilterNone;
    [self.locationManager startUpdatingLocation];
    [locationManager requestAlwaysAuthorization];
    float latitude = locationManager.location.coordinate.latitude;
    float longitude = locationManager.location.coordinate.longitude;
    

    NSTimeZone *timeZone = [NSTimeZone localTimeZone];
    
    KCGeoLocation *location = [[KCGeoLocation alloc] initWithLatitude:latitude andLongitude:longitude andTimeZone:timeZone];
    KCAstronomicalCalendar *calendar = [[KCAstronomicalCalendar alloc] initWithLocation:location];
    
    NSDateFormatter *format = [[NSDateFormatter alloc] init];
    [format setDateFormat:@"MMMM dd, yyyy (EEEE) h:mm:ss a z Z"];
    NSDate *now = [calendar sunset];
    
    NSLog(@"sunset: %@", now);
    NSString *nsstr = [format stringFromDate:now];

    label1.text =nsstr;
    


    
    
    
    
    //Replace the methods below with your required method name.
    if ([locationManager respondsToSelector:@selector(requestWhenInUseAuthorization)]) {
        [locationManager requestWhenInUseAuthorization];
        
    }

    
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

-(void)HebrewDay{
    NSDate *Date = [NSDate date];
    NSInteger dayOfSefira = [KCSefiratHaomerCalculator dayOfSefiraForDate:Date];
    
    if (dayOfSefira==25) {
        label3.text = @"today is 18";
        NSLog(@"Today is the 18th day of Sefira");
    }
    else if (dayOfSefira==18){
        label3.text = @"today is not 18";
        NSLog(@"Today is not the 18th day of Sefira");
        
    }

    
}



-(void)theMagicDate{
    NSTimeZone *timeZone = [NSTimeZone localTimeZone];

    self.locationManager = [[CLLocationManager alloc] init];
    self.locationManager.delegate = self;
    self.locationManager.desiredAccuracy = kCLLocationAccuracyBest;
    self.locationManager.distanceFilter = kCLDistanceFilterNone;
    [self.locationManager startUpdatingLocation];
    [locationManager requestAlwaysAuthorization];
    float latitude = locationManager.location.coordinate.latitude;
    float longitude = locationManager.location.coordinate.longitude;

    KCGeoLocation *location = [[KCGeoLocation alloc] initWithLatitude:latitude andLongitude:longitude andTimeZone:timeZone];

    KCAstronomicalCalendar *calendar = [[KCAstronomicalCalendar alloc] initWithLocation:location];

    NSDate *now = [calendar sunset];
    
    NSCalendar *nextCal = [[NSCalendar alloc]initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
    NSDateComponents *nextComp = [nextCal components:NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay | NSCalendarUnitHour | NSCalendarUnitMinute fromDate:now];
    
   
    NSDate *dateToCheck = [nextCal dateFromComponents:nextComp];
    NSDate *now2 = [NSDate date];

  
switch ([now2 compare:dateToCheck]) {
        case NSOrderedAscending:{
            NSInteger dayOfSefira1 = [KCSefiratHaomerCalculator dayOfSefiraForDate:now2];
            
            if (dayOfSefira1==1) {
                label3.text = @"today is 1";
            }
            else if (dayOfSefira1==2){
                label3.text = @"today is 2";
                
            }
            else if (dayOfSefira1==3){
                label3.text = @"today is 3";
                
            }
            else if (dayOfSefira1==4){
                label3.text = @"today is 4";
                
            }
            else if (dayOfSefira1==5){
                label3.text = @"today is 5";
                
            }
            else if (dayOfSefira1==6){
                label3.text = @"today is 6";
                
            }
            else if (dayOfSefira1==7){
                label3.text = @"today is 7";
                
            }
            else if (dayOfSefira1==8){
                label3.text = @"today is 8";
                
            }
            else if (dayOfSefira1==9){
                label3.text = @"today is 9";
                
            }
            else if (dayOfSefira1==10){
                label3.text = @"today is 10";
                
            }
            else if (dayOfSefira1==11){
                label3.text = @"today is 11";
                
            }
            else if (dayOfSefira1==12){
                label3.text = @"today is 12";
                
            }
            else if (dayOfSefira1==13){
                label3.text = @"today is 13";
                
            }
            else if (dayOfSefira1==14){
                label3.text = @"today is 14";
                
            }
            else if (dayOfSefira1==15){
                label3.text = @"today is 15";
                
            }
            else if (dayOfSefira1==16){
                label3.text = @"today is 16";
                
            }
            else if (dayOfSefira1==17){
                label3.text = @"today is 17";
                
            }
            else if (dayOfSefira1==18){
                label3.text = @"today is 18";
                
            }
            else if (dayOfSefira1==19){
                label3.text = @"today is 19";
                
            }
            else if (dayOfSefira1==20){
                label3.text = @"today is 20";
                
            }
            else if (dayOfSefira1==21){
                label3.text = @"today is 21";
                
            }
            else if (dayOfSefira1==22){
                label3.text = @"today is 22";
                
            }
            else if (dayOfSefira1==23){
                label3.text = @"today is 23";
                
            }
            else if (dayOfSefira1==24){
                label3.text = @"today is 24";
                
            }
            else if (dayOfSefira1==25){
                label3.text = @"today is 25";
                
            }
            else if (dayOfSefira1==26){
                label3.text = @"today is 26";
                
            }
            else if (dayOfSefira1==27){
                label3.text = @"today is 27";
                
            }
            else if (dayOfSefira1==28){
                label3.text = @"today is 28";
                
            }
            else if (dayOfSefira1==29){
                label3.text = @"today is 29";
                
            }
            else if (dayOfSefira1==30){
                label3.text = @"today is 30";
                
            }
            else if (dayOfSefira1==31){
                label3.text = @"today is 31";
                
            }
            else if (dayOfSefira1==32){
                label3.text = @"today is 32";
                
            }
            else if (dayOfSefira1==33){
                label3.text = @"today is 33";
                
            }
            else if (dayOfSefira1==34){
                label3.text = @"today is 34";
                
            }
            else if (dayOfSefira1==35){
                label3.text = @"today is 35";
                
            }
            else if (dayOfSefira1==36){
                label3.text = @"today is 36";
                
            }
            else if (dayOfSefira1==37){
                label3.text = @"today is 37";
                
            }
            else if (dayOfSefira1==38){
                label3.text = @"today is 38";
                
            }
            else if (dayOfSefira1==39){
                label3.text = @"today is 39";
                
            }
            else if (dayOfSefira1==40){
                label3.text = @"today is 40";
                
            }
            else if (dayOfSefira1==41){
                label3.text = @"today is 41";
                
            }
            else if (dayOfSefira1==42){
                label3.text = @"today is 42";
                
            }
            else if (dayOfSefira1==43){
                label3.text = @"today is 43";
                
            }
            else if (dayOfSefira1==44){
                label3.text = @"today is 44";
                
            }
            else if (dayOfSefira1==45){
                label3.text = @"today is 45";
                
            }
            else if (dayOfSefira1==46){
                label3.text = @"today is 46";
                
            }
            else if (dayOfSefira1==47){
                label3.text = @"today is 47";
                
            }
            else if (dayOfSefira1==48){
                label3.text = @"today is 48";
                
            }
            else if (dayOfSefira1==49){
                label3.text = @"today is 49";
                
            }


            
            
            [self DayIsInFuture];
        }
            break;
            
        case NSOrderedDescending:{
            int daysToAdd = 1;
            NSDate *newDate2 = [now2 dateByAddingTimeInterval:60*60*24*daysToAdd];
            NSInteger dayOfSefira1 = [KCSefiratHaomerCalculator dayOfSefiraForDate:newDate2];

            
            if (dayOfSefira1==1) {
                label3.text = @"today is 1";
            }
            else if (dayOfSefira1==2){
                label3.text = @"today is 2";
                
            }
            else if (dayOfSefira1==3){
                label3.text = @"today is 3";
                
            }
            else if (dayOfSefira1==4){
                label3.text = @"today is 4";
                
            }
            else if (dayOfSefira1==5){
                label3.text = @"today is 5";
                
            }
            else if (dayOfSefira1==6){
                label3.text = @"today is 6";
                
            }
            else if (dayOfSefira1==7){
                label3.text = @"today is 7";
                
            }
            else if (dayOfSefira1==8){
                label3.text = @"today is 8";
                
            }
            else if (dayOfSefira1==9){
                label3.text = @"today is 9";
                
            }
            else if (dayOfSefira1==10){
                label3.text = @"today is 10";
                
            }
            else if (dayOfSefira1==11){
                label3.text = @"today is 11";
                
            }
            else if (dayOfSefira1==12){
                label3.text = @"today is 12";
                
            }
            else if (dayOfSefira1==13){
                label3.text = @"today is 13";
                
            }
            else if (dayOfSefira1==14){
                label3.text = @"today is 14";
                
            }
            else if (dayOfSefira1==15){
                label3.text = @"today is 15";
                
            }
            else if (dayOfSefira1==16){
                label3.text = @"today is 16";
                
            }
            else if (dayOfSefira1==17){
                label3.text = @"today is 17";
                
            }
            else if (dayOfSefira1==18){
                label3.text = @"today is 18";
                
            }
            else if (dayOfSefira1==19){
                label3.text = @"today is 19";
                
            }
            else if (dayOfSefira1==20){
                label3.text = @"today is 20";
                
            }
            else if (dayOfSefira1==21){
                label3.text = @"today is 21";
                
            }
            else if (dayOfSefira1==22){
                label3.text = @"today is 22";
                
            }
            else if (dayOfSefira1==23){
                label3.text = @"today is 23";
                
            }
            else if (dayOfSefira1==24){
                label3.text = @"today is 24";
                
            }
            else if (dayOfSefira1==25){
                label3.text = @"today is 25";
                
            }
            else if (dayOfSefira1==26){
                label3.text = @"today is 26";
                
            }
            else if (dayOfSefira1==27){
                label3.text = @"today is 27";
                
            }
            else if (dayOfSefira1==28){
                label3.text = @"today is 28";
                
            }
            else if (dayOfSefira1==29){
                label3.text = @"today is 29";
                
            }
            else if (dayOfSefira1==30){
                label3.text = @"today is 30";
                
            }
            else if (dayOfSefira1==31){
                label3.text = @"today is 31";
                
            }
            else if (dayOfSefira1==32){
                label3.text = @"today is 32";
                
            }
            else if (dayOfSefira1==33){
                label3.text = @"today is 33";
                
            }
            else if (dayOfSefira1==34){
                label3.text = @"today is 34";
                
            }
            else if (dayOfSefira1==35){
                label3.text = @"today is 35";
                
            }
            else if (dayOfSefira1==36){
                label3.text = @"today is 36";
                
            }
            else if (dayOfSefira1==37){
                label3.text = @"today is 37";
                
            }
            else if (dayOfSefira1==38){
                label3.text = @"today is 38";
                
            }
            else if (dayOfSefira1==39){
                label3.text = @"today is 39";
                
            }
            else if (dayOfSefira1==40){
                label3.text = @"today is 40";
                
            }
            else if (dayOfSefira1==41){
                label3.text = @"today is 41";
                
            }
            else if (dayOfSefira1==42){
                label3.text = @"today is 42";
                
            }
            else if (dayOfSefira1==43){
                label3.text = @"today is 43";
                
            }
            else if (dayOfSefira1==44){
                label3.text = @"today is 44";
                
            }
            else if (dayOfSefira1==45){
                label3.text = @"today is 45";
                
            }
            else if (dayOfSefira1==46){
                label3.text = @"today is 46";
                
            }
            else if (dayOfSefira1==47){
                label3.text = @"today is 47";
                
            }
            else if (dayOfSefira1==48){
                label3.text = @"today is 48";
                
            }
            else if (dayOfSefira1==49){
                label3.text = @"today is 49";
                
            }

            [self DayIsInPast];
        }
          break;
            
        case NSOrderedSame:{
            NSLog(@"Date is now");
        }
            break;
    }
    
}
-(void)DayIsInFuture{
    NSDate *now2 = [NSDate date];

    NSLog(@"Date in the future");
    NSInteger dayOfSefira1 = [KCSefiratHaomerCalculator dayOfSefiraForDate:now2];
    NSLog(@"Day Of Sefira: %ld", (long)dayOfSefira1);
    NSString *inStr = [NSString stringWithFormat: @"%ld", (long)dayOfSefira1];
    label.text = [NSString stringWithFormat:@"Day Of Sefira: %@", inStr];
    
}

-(void)DayIsInPast{
    int daysToAdd = 1;

    NSDate *now2 = [NSDate date];
    NSDate *newDate2 = [now2 dateByAddingTimeInterval:60*60*24*daysToAdd];
    NSLog(@"Date in the past");
    NSInteger dayOfSefira = [KCSefiratHaomerCalculator dayOfSefiraForDate:newDate2];
    NSLog(@"Day Of Sefira: %ld", (long)dayOfSefira);
    NSString *inStr2 = [NSString stringWithFormat: @"%ld", (long)dayOfSefira];
    label.text = [NSString stringWithFormat:@"Day Of Sefira: %@", inStr2];
    
}


- (IBAction)Button:(id)sender{


   

    
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
@end
