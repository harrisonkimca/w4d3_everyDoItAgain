//
//  TableViewCell.h
//  2w4d3_every.DoItAgain
//
//  Created by Seantastic31 on 19/07/2017.
//  Copyright © 2017 Seantastic31. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TableViewCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UILabel *priorityLabel;
@property (weak, nonatomic) IBOutlet UILabel *descriptionLabel;

@end
