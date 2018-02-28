//
//  NewItemViewController.h
//  Every.Do.2
//
//  Created by Chris Eloranta on 2018-02-27.
//  Copyright © 2018 Christopher Eloranta. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ToDo.h"

@protocol AddToDoProtocol

-(void)addToDo:(ToDo*)toDo;





@end


@interface NewItemViewController : UIViewController


@property (weak) id <AddToDoProtocol> delegate;


@property (weak, nonatomic) IBOutlet UITextField *addItemTextField;
@property (weak, nonatomic) IBOutlet UITextField *addItemDescriptionField;
@property (weak, nonatomic) IBOutlet UITextField *addItemPriorityField;



@end
