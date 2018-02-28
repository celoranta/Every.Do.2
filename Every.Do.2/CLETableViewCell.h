//
//  CLETableViewCell.h
//  Every.Do.2
//
//  Created by Chris Eloranta on 2018-02-27.
//  Copyright © 2018 Christopher Eloranta. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CLETableViewCell : UITableViewCell 

@property (weak, nonatomic) IBOutlet UILabel *toDoCell;
@property (weak, nonatomic) IBOutlet UILabel *toDoCellDescriptionLabel;
@property (weak, nonatomic) IBOutlet UILabel *toDoCellPriorityLabel;



@end
