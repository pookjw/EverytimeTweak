#import "MainViewController.h"

@implementation MainViewController
- (void)viewDidLoad {
    [super viewDidLoad];

    self.view.backgroundColor = [UIColor clearColor];
    self.title = @"EverytimeTweak";

    self.model = [Model sharedInstance];

    self.tableView = [[UITableView alloc] init];
    self.tableView.backgroundColor = [UIColor clearColor];
    [self.tableView setSeparatorColor:[[UIColor whiteColor] colorWithAlphaComponent:0.25]];
    [self.view addSubview:self.tableView];
    self.tableView.translatesAutoresizingMaskIntoConstraints = NO;
    [self.tableView.topAnchor constraintEqualToAnchor:self.view.topAnchor].active = YES;
    [self.tableView.bottomAnchor constraintEqualToAnchor:self.view.bottomAnchor].active = YES;
    [self.tableView.leadingAnchor constraintEqualToAnchor:self.view.leadingAnchor].active = YES;
    [self.tableView.trailingAnchor constraintEqualToAnchor:self.view.trailingAnchor].active = YES;
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"cell"];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 2;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [self.tableView dequeueReusableCellWithIdentifier:@"cell"];
    cell.backgroundColor = [UIColor clearColor];
    cell.textLabel.textColor = [UIColor whiteColor];

    UISwitch *switchView;
    switch (indexPath.row) {
        case 0:
            switchView = [[UISwitch alloc] initWithFrame:CGRectZero];
            cell.textLabel.text = @"글 목록에서 광고 제거";
            cell.selectionStyle = UITableViewCellSelectionStyleNone;
            cell.accessoryType = UITableViewCellAccessoryNone;
            cell.accessoryView = switchView;
            [switchView setOn:self.model.removeAdViewOnArticleList animated:YES];
            [switchView addTarget:self action:@selector(firstItemChanged:) forControlEvents:UIControlEventValueChanged];
            switchView = nil;
            break;
        case 1:
            switchView = [[UISwitch alloc] initWithFrame:CGRectZero];
            cell.textLabel.text = @"댓글 목록에서 광고 제거";
            cell.selectionStyle = UITableViewCellSelectionStyleNone;
            cell.accessoryType = UITableViewCellAccessoryNone;
            cell.accessoryView = switchView;
            [switchView setOn:self.model.removeAdViewOnCommentList animated:YES];
            [switchView addTarget:self action:@selector(secondItemChanged:) forControlEvents:UIControlEventValueChanged];
            switchView = nil;
            break;
    }
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    switch (indexPath.row) {
        case 0:
            break;
        case 1:
            break;
        default:
            break;
    }
    [self.tableView deselectRowAtIndexPath:indexPath animated:YES];
}

- (void)firstItemChanged:(UISwitch*)sender {
    [self.model killEverytime];
    self.model.removeAdViewOnArticleList = sender.on;
}

- (void)secondItemChanged:(UISwitch*)sender {
    [self.model killEverytime];
    self.model.removeAdViewOnCommentList = sender.on;
}
@end