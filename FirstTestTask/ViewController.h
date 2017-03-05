//
//  ViewController.h
//  FirstTestTask
//
//  Created by Alex Hafros on 05.03.17.
//  Copyright © 2017 Alex Hafros. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MKDropdownMenu.h"

@interface ViewController : UIViewController<MKDropdownMenuDelegate,MKDropdownMenuDataSource>{
    NSMutableArray * productsArray;
    NSString * currentLang;
    int count;
    int currentProduct;
}
@property (weak, nonatomic) IBOutlet MKDropdownMenu *dropMenu;
@property (weak, nonatomic) IBOutlet UISegmentedControl *control;
@property (weak, nonatomic) IBOutlet UIView *outputView;
- (IBAction)DidCangeValue:(id)sender;

- (IBAction)didSelectSegment:(id)sender;
@property (weak, nonatomic) IBOutlet UILabel *outputLabel;

@end

