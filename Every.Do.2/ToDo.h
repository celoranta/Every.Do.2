//
//  ToDo.h
//  Every.Do.2
//
//  Created by Chris Eloranta on 2018-02-27.
//  Copyright © 2018 Christopher Eloranta. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIkit.h>

@interface ToDo : NSObject

@property (nonatomic) NSString *toDoTitle;
@property (nonatomic) NSString *toDoDescription;
@property (nonatomic) int toDoPriority;
@property (nonatomic) bool toDoIsComplete;
@property (nonatomic) NSString *toDoPriorityString;


@end
