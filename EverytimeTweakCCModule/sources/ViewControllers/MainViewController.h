#import <UIKit/UIKit.h>
#import "../Model/Model.h"

@interface MainViewController : UIViewController <UITableViewDelegate, UITableViewDataSource>
@property Model *model;
@property UITableView *tableView;
@end