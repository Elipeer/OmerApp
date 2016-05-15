//
//  ViewController.h
//  Omer
//
//  Created by Eli Peer on 5/3/16.
//  Copyright © 2016 elipeer. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "KosherCocoa/KosherCocoa.h"
#import <KosherCocoa/KosherCocoa.h>
#import <CoreLocation/CoreLocation.h>
@interface ViewController : UIViewController <CLLocationManagerDelegate>
{
    
    IBOutlet UILabel *label;
    IBOutlet UILabel *label1;
    IBOutlet UILabel *label3;

    IBOutlet UITextView *textView;
    
    
}
@property (nonatomic, retain) CLLocationManager *locationManager;

@end

