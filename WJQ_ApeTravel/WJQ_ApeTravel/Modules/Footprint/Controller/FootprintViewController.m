//
//  FootprintViewController.m
//  WJQ_ApeTravel
//
//  Created by dllo on 16/9/21.
//  Copyright © 2016年 Mars02400059. All rights reserved.
//

#import "FootprintViewController.h"
#import "AZBaseLabel.h"
#import "AZBaseButton.h"
#import "FootprintPopBournModel.h"

static NSString *const collectionViewCellIndentifier = @"collectionViewCell";

static NSString *const tableViewCellIndentifier = @"tableViewCell";

@interface FootprintViewController ()
<
UITableViewDelegate,
UITableViewDataSource
>
// 北美洲
@property (nonatomic, strong) AZBaseButton *northAmericaButton;
// 南美洲
@property (nonatomic, strong) AZBaseButton *southAmericaButton;
// 欧洲
@property (nonatomic, strong) AZBaseButton *europeButton;
// 非洲
@property (nonatomic, strong) AZBaseButton *africaButton;
// 亚洲
@property (nonatomic, strong) AZBaseButton *asiaButton;
// 大洋洲
@property (nonatomic, strong) AZBaseButton *oceaniaButton;
// 南极洲
@property (nonatomic, strong) AZBaseButton *antarctionButton;
/// 热门目的地
@property (nonatomic, strong) UICollectionView *popBournCollectionView;
/// 其他
@property (nonatomic, strong) UITableView *restTableView;
/// 存放热门地区的数组
@property (nonatomic, strong) NSMutableArray *popBournArray;
/// 存放其他地区的数组
@property (nonatomic, strong) NSMutableArray *restArray;

@property (nonatomic, copy) NSString *str;
@end

@implementation FootprintViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationController.navigationBar.hidden = NO;
    self.navigationController.navigationBar.barTintColor = [UIColor colorWithRed:0.29 green:0.75 blue:0.47 alpha:1.000];
    
    [self createMapSubView];
}

- (void)createMapSubView {
    
    UIImageView *mapImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"地图"]];
    mapImageView.userInteractionEnabled = YES;
    mapImageView.frame = CGRectMake(0, 0, self.view.width, self.view.width / 1.8);
    [self.view addSubview:mapImageView];
    
    UILabel *mapLabel = [[UILabel alloc] initWithFrame:mapImageView.bounds];
    mapLabel.backgroundColor = [UIColor colorWithRed:0.178 green:0.728 blue:0.960 alpha:0.350];
    [mapImageView addSubview:mapLabel];
    
    
    
    CGFloat width = self.view.width / 414;
    CGFloat height = self.view.height / 736;
    // 北美洲
    CGFloat northAmericaX = 55 * width;
    CGFloat northAmericaY = 50 * height;
    AZBaseLabel *northAmericaLabel = [[AZBaseLabel alloc] initWithFrame:CGRectMake(northAmericaX, northAmericaY, 10, 10)];
    [mapImageView addSubview:northAmericaLabel];
    
    self.northAmericaButton = [AZBaseButton buttonWithType:UIButtonTypeCustom];
    _northAmericaButton.number = @234;
    _northAmericaButton.tag = 1234;
    _northAmericaButton.x = northAmericaX - 23;
    _northAmericaButton.y = northAmericaY - 30;
    [_northAmericaButton addTarget:self action:@selector(northAmericaButtonAction:) forControlEvents:UIControlEventTouchUpInside];
    [mapImageView addSubview:_northAmericaButton];
    
    
    // 南美洲
    CGFloat southAmericaX = 115 * width;
    CGFloat southAmericaY = 155 * height;
    AZBaseLabel *southAmericaLabel = [[AZBaseLabel alloc] initWithFrame:CGRectMake(southAmericaX, southAmericaY, 10, 10)];
    [mapImageView addSubview:southAmericaLabel];
    
    self.southAmericaButton = [AZBaseButton buttonWithType:UIButtonTypeCustom];
    _southAmericaButton.number = @235;
    _southAmericaButton.tag = 1235;
    _southAmericaButton.x = southAmericaX - 23;
    _southAmericaButton.y = southAmericaY - 30;
    [_southAmericaButton addTarget:self action:@selector(southAmericaButtonAction:) forControlEvents:UIControlEventTouchUpInside];
    [mapImageView addSubview:_southAmericaButton];
    
    // 欧洲
    CGFloat europeX = 245 * width;
    CGFloat europeY = 42 * height;
    AZBaseLabel *europeLabel = [[AZBaseLabel alloc] initWithFrame:CGRectMake(europeX, europeY, 10, 10)];
    [mapImageView addSubview:europeLabel];
    
    self.europeButton = [AZBaseButton buttonWithType:UIButtonTypeCustom];
    _europeButton.number = @12;
    _europeButton.tag = 1012;
    _europeButton.x = europeX - 23;
    _europeButton.y = europeY - 30;
    [_europeButton addTarget:self action:@selector(europeButtonAction:) forControlEvents:UIControlEventTouchUpInside];
    [mapImageView addSubview:_europeButton];
    
    // 非洲
    CGFloat africaX = 225 * width;
    CGFloat africaY = 140 * height;
    AZBaseLabel *africaLabel = [[AZBaseLabel alloc] initWithFrame:CGRectMake(africaX, africaY, 10, 10)];
    [mapImageView addSubview:africaLabel];
    
    self.africaButton = [AZBaseButton buttonWithType:UIButtonTypeCustom];
    _africaButton.number = @76;
    _africaButton.tag = 76;
    _africaButton.x = africaX - 23;
    _africaButton.y = africaY - 30;
    [_africaButton addTarget:self action:@selector(africaButtonAction:) forControlEvents:UIControlEventTouchUpInside];
//    [_africaButton setTitle:@"非洲" forState:UIControlStateNormal];
    [mapImageView addSubview:_africaButton];
    
    // 亚洲
    CGFloat asiaX = 320 * width;
    CGFloat asizY = 75 * height;
    AZBaseLabel *asiaLabel = [[AZBaseLabel alloc] initWithFrame:CGRectMake(asiaX, asizY, 10, 10)];
    [mapImageView addSubview:asiaLabel];
    
    self.asiaButton = [AZBaseButton buttonWithType:UIButtonTypeCustom];
    _asiaButton.number = @10;
    _asiaButton.tag = 1010;
    _asiaButton.click = NO;
    [_asiaButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [_asiaButton setBackgroundImage:[UIImage imageNamed:@"按压后气泡"]forState:UIControlStateNormal];
    _asiaButton.x = asiaX - 23;
    _asiaButton.y = asizY - 30;
    [_asiaButton addTarget:self action:@selector(asiaButtonAction:) forControlEvents:UIControlEventTouchUpInside];
//    [_asiaButton setTitle:@"亚洲" forState:UIControlStateNormal];
    [mapImageView addSubview:_asiaButton];
    
    // 大洋洲
    CGFloat oceaniaX = 350 * width;
    CGFloat oceaniaY = 145 * height;
    AZBaseLabel *oceaniaLabel = [[AZBaseLabel alloc] initWithFrame:CGRectMake(oceaniaX, oceaniaY, 10, 10)];
    [mapImageView addSubview:oceaniaLabel];
    
    self.oceaniaButton = [AZBaseButton buttonWithType:UIButtonTypeCustom];
    _oceaniaButton.number = @239;
    _oceaniaButton.tag = 1239;
    _oceaniaButton.x = oceaniaX - 23;
    _oceaniaButton.y = oceaniaY - 30;
    [_oceaniaButton addTarget:self action:@selector(oceaniaButtonAction:) forControlEvents:UIControlEventTouchUpInside];
//    [_oceaniaButton setTitle:@"大洋洲" forState:UIControlStateNormal];
    [mapImageView addSubview:_oceaniaButton];
    
    // 南极洲
    CGFloat antarctioncaX = 285 * width;
    CGFloat antarctioncaY = 210 * height;
    AZBaseLabel *antarcticaLabel = [[AZBaseLabel alloc] initWithFrame:CGRectMake(antarctioncaX, antarctioncaY, 10, 10)];
    [mapImageView addSubview:antarcticaLabel];
    
    self.antarctionButton = [AZBaseButton buttonWithType:UIButtonTypeCustom];
    _antarctionButton.number = @759;
    _antarctionButton.tag = 1759;
    _antarctionButton.x = antarctioncaX - 23;
    _antarctionButton.y = antarctioncaY - 30;
    [_antarctionButton addTarget:self action:@selector(antarctionButtonAction:) forControlEvents:UIControlEventTouchUpInside];
//    [_antarctionButton setTitle:@"南极洲" forState:UIControlStateNormal];
    [mapImageView addSubview:_antarctionButton];

}




// 北美洲点击事件
- (void)northAmericaButtonAction:(AZBaseButton *)northAmericaButton {

    [self WJQ_changeAlveoliAZBaseButton:northAmericaButton];
}
// 南美洲点击事件
- (void)southAmericaButtonAction:(AZBaseButton *)southAmericaButton {
    
    [self WJQ_changeAlveoliAZBaseButton:southAmericaButton];
}
// 欧洲点击事件
- (void)europeButtonAction:(AZBaseButton *)europeButton {
    
    [self WJQ_changeAlveoliAZBaseButton:europeButton];
}
// 非洲点击事件
- (void)africaButtonAction:(AZBaseButton *)africaButton {
    
    [self WJQ_changeAlveoliAZBaseButton:africaButton];
}
// 亚洲点击事件
- (void)asiaButtonAction:(AZBaseButton *)asiaButton {
    
    [self WJQ_changeAlveoliAZBaseButton:asiaButton];
}
// 大洋洲点击事件
- (void)oceaniaButtonAction:(AZBaseButton *)oceaniaButton {
    
    [self WJQ_changeAlveoliAZBaseButton:oceaniaButton];
}
// 南极洲点击事件
- (void)antarctionButtonAction:(AZBaseButton *)antarctionButton {
    
    [self WJQ_changeAlveoliAZBaseButton:antarctionButton];
}
// 变化气泡
- (void)WJQ_changeAlveoliAZBaseButton:(AZBaseButton *)AZBaseButton {
    
    // 判断按钮是否处于选中状态, 当按钮处于没有选中时可进入此方法
    if (AZBaseButton.click) {
         // 将所有的按钮变回没有选中的状态
         if (AZBaseButton.clickTwo) {
             [_northAmericaButton setBackgroundImage:[UIImage imageNamed:@"气泡"]forState:UIControlStateNormal];
             [_northAmericaButton setTitleColor:[UIColor colorWithWhite:0.476 alpha:1.000] forState:UIControlStateNormal];
             _northAmericaButton.click = YES;
             [_southAmericaButton setBackgroundImage:[UIImage imageNamed:@"气泡"]forState:UIControlStateNormal];
             [_southAmericaButton setTitleColor:[UIColor colorWithWhite:0.476 alpha:1.000] forState:UIControlStateNormal];
             _southAmericaButton.click = YES;
             [_europeButton setBackgroundImage:[UIImage imageNamed:@"气泡"]forState:UIControlStateNormal];
             [_europeButton setTitleColor:[UIColor colorWithWhite:0.476 alpha:1.000] forState:UIControlStateNormal];
             _europeButton.click = YES;
             [_africaButton setBackgroundImage:[UIImage imageNamed:@"气泡"]forState:UIControlStateNormal];
             [_africaButton setTitleColor:[UIColor colorWithWhite:0.476 alpha:1.000] forState:UIControlStateNormal];
             _africaButton.click = YES;
             [_asiaButton setBackgroundImage:[UIImage imageNamed:@"气泡"]forState:UIControlStateNormal];
             [_asiaButton setTitleColor:[UIColor colorWithWhite:0.476 alpha:1.000] forState:UIControlStateNormal];
             _asiaButton.click = YES;
             [_oceaniaButton setBackgroundImage:[UIImage imageNamed:@"气泡"]forState:UIControlStateNormal];
             [_oceaniaButton setTitleColor:[UIColor colorWithWhite:0.476 alpha:1.000] forState:UIControlStateNormal];
             _oceaniaButton.click = YES;
             [_antarctionButton setBackgroundImage:[UIImage imageNamed:@"气泡"]forState:UIControlStateNormal];
             [_antarctionButton setTitleColor:[UIColor colorWithWhite:0.476 alpha:1.000] forState:UIControlStateNormal];
             _antarctionButton.click = YES;

         }
         // 将当前点击的按钮置成选中状态
        [AZBaseButton setBackgroundImage:[UIImage imageNamed:@"按压后气泡"] forState:UIControlStateNormal];
        [AZBaseButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        AZBaseButton.click = NO;
         
    }
}


- (void)dataProcessingNumber:(NSInteger)number {
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    NSString *url = @"http://open.qyer.com/qyer/footprint/continent_list?client_id=qyer_android&client_secret=9fcaae8aefc4f9ac4915&v=1&track_deviceid=A1000052A2BCDD&track_app_version=7.0.2&track_app_channel=baidu&track_device_info=PD1524B&track_os=Android5.1&app_installtime=1474192132493";
    [manager GET:url parameters:nil progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        NSArray *dataArray = [responseObject objectForKey:@"data"];
        for (NSDictionary *dataDic in dataArray) {
//            if (10 == [dataDic objectForKey:@"data"]) {
//                
//            }
        }
        
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSLog(@"error : %@", error);
    }];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
