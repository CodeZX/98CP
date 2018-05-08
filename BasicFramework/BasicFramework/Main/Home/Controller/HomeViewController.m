//
//  HomeViewController.m
//  BasicFramework
//
//  Created by apple on 2018/5/8.
//  Copyright © 2018年 Rainy. All rights reserved.
//

#import "HomeViewController.h"

#import "LYLCycleImages.h"
#import "LGScrollLabel.h"

@interface HomeViewController ()<UICollectionViewDelegate,UICollectionViewDataSource>
@property (nonatomic,weak) LYLCycleImages *banner;
@property (nonatomic,weak) LGScrollLabel *scrollLabel;
@property (nonatomic,weak) UICollectionView *collectionView;
@end

@implementation HomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupUI];
}

- (void)setupUI {
    
    LYLCycleImages *banner = [[LYLCycleImages alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 200)];
    banner.images = @[@"http://img5.duitang.com/uploads/item/201411/06/20141106104720_WHEe2.jpeg",@"http://img5.duitang.com/uploads/item/201411/06/20141106104720_WHEe2.jpeg",@"http://img5.duitang.com/uploads/item/201411/06/20141106104720_WHEe2.jpeg"];
    [self.view addSubview:banner];
    self.banner = banner;
    
    
    LGScrollLabel *scrollLabel = [[LGScrollLabel alloc]initWithFrame:CGRectMake(0, 220, SCREEN_WIDTH, 44)];
    scrollLabel.backgroundColor = GrayColor;
    scrollLabel.strings = @[@"为人民服98CP",@"98CP98cp98cp98cp98cp98cp",@"98CP98cp98cp98cp98cp",@"98CP98cp98cp98cp98cp"];
    scrollLabel.textColor = WhiteColor;
    scrollLabel.textFont = [UIFont systemFontOfSize:30];
    scrollLabel.loops = YES;
    scrollLabel.speed = 15.0;
    
    scrollLabel.direction = LGScrollLabelDirectionRTL;
    [self.view addSubview:scrollLabel];
    self.scrollLabel = scrollLabel;
    [self.scrollLabel start];
    
    CGRect rect =  CGRectMake(0, 280, SCREEN_WIDTH, SCREEN_HEIGHT - 280);
    UICollectionViewFlowLayout * layout = [[UICollectionViewFlowLayout alloc]init];
    layout.sectionInset = UIEdgeInsetsMake(20, 20, 20, 20);
    //设置布局方向为垂直流布局
    layout.scrollDirection = UICollectionViewScrollDirectionVertical;
    //设置每个item的大小为100*100
    layout.itemSize = CGSizeMake((SCREEN_WIDTH - 60)/2, (SCREEN_WIDTH - 60)/2);
    UICollectionView *collectionView = [[UICollectionView alloc]initWithFrame:rect collectionViewLayout:layout];
    collectionView.backgroundColor = WhiteColor;
    collectionView.dataSource = self;
    collectionView.delegate = self;
    [self.view addSubview:collectionView];
    self.collectionView = collectionView;
    
    //注册item类型 这里使用系统的类型
    [self.collectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:@"cellid"];
}

#pragma mark -------------------------- collectionView delegate ----------------------------------------

//返回分区个数
-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    return 1;
}
//返回每个分区的item个数
-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return 20;
}
//返回每个item
-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    UICollectionViewCell * cell  = [collectionView dequeueReusableCellWithReuseIdentifier:@"cellid" forIndexPath:indexPath];
    cell.backgroundColor = [UIColor colorWithRed:arc4random()%255/255.0 green:arc4random()%255/255.0 blue:arc4random()%255/255.0 alpha:1];
    return cell;
}


@end
