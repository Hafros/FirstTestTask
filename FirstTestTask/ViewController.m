//
//  ViewController.m
//  FirstTestTask
//
//  Created by Alex Hafros on 05.03.17.
//  Copyright © 2017 Alex Hafros. All rights reserved.
//

#import "ViewController.h"
#import "RulesSingleton.h"
#import "ProductModel.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    currentLang = @"ru";
    productsArray = [[NSMutableArray alloc] init];
    [self initProducts];
    
    
    _dropMenu.dataSource = self;
    _dropMenu.delegate = self;
    
}



- (NSInteger)numberOfComponentsInDropdownMenu:(MKDropdownMenu *)dropdownMenu {
    return 1;
}

- (NSInteger)dropdownMenu:(MKDropdownMenu *)dropdownMenu numberOfRowsInComponent:(NSInteger)component {
    return productsArray.count;
}



- (NSString *)dropdownMenu:(MKDropdownMenu *)dropdownMenu titleForComponent:(NSInteger)component{
    return @"Выберите продукт";
}

- (NSString *)dropdownMenu:(MKDropdownMenu *)dropdownMenu titleForRow:(NSInteger)row forComponent:(NSInteger)component{
    ProductModel * product = [productsArray objectAtIndex:row];
    
    return product.name;
}

- (void)dropdownMenu:(MKDropdownMenu *)dropdownMenu didSelectRow:(NSInteger)row inComponent:(NSInteger)component {
        currentProduct = row;
        count = 1;
        [self DidChangeLabel];
        [dropdownMenu closeAllComponentsAnimated:YES];
}

- (void)initProducts{
    count = 1;
    _outputLabel.text = @"";
    [productsArray removeAllObjects];
    
    NSDictionary *dictionary = [NSDictionary dictionaryWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"products" ofType:@"plist"]];
    for (NSString * key in [[dictionary objectForKey:currentLang] allKeys]) {
        
        ProductModel * product = [[ProductModel alloc] init];
        product.name = key;
        
        [productsArray addObject:product];
        
    }
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)DidChangeLabel{
    _outputLabel.text = [NSString stringWithFormat:@"%i %@",count,[[RulesSingleton sharedInstance] returnStringWithRule:[productsArray objectAtIndex:currentProduct] count:count langPrefix:currentLang]];
    
}

- (IBAction)DidCangeValue:(id)sender {
    switch ([sender selectedSegmentIndex]) {
        case 0:
            if (count != 0) {
                count -=1;
            }
            
            break;
        case 1:
            count +=1;
            break;
            
        default:
            break;
    }
    
    [self DidChangeLabel];

}

- (IBAction)didSelectSegment:(id)sender {
    switch ([sender selectedSegmentIndex]) {
        case 0:
            currentLang = @"ru";
            break;
        case 1:
            currentLang = @"en";
            break;
            
        default:
            break;
    }
    
    [self initProducts];
}



@end
