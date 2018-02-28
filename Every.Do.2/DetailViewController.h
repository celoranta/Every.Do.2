//
//  DetailViewController.h
//  Every.Do.2
//
//  Created by Chris Eloranta on 2018-02-27.
//  Copyright © 2018 Christopher Eloranta. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DetailViewController : UIViewController

@property (strong, nonatomic) id detailItem;
@property (weak, nonatomic) IBOutlet UILabel *detailDescriptionLabel;

@end

