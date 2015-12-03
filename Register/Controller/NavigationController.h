//
//  NavigationController.h
//  Register
//
//  Created by lmj on 15-10-4.
//
//

#import <UIKit/UIKit.h>
@protocol NavigationControllerDelegate;

@interface NavigationController : UIView

@property (nonatomic,assign) id<NavigationControllerDelegate> delegate;

@property (nonatomic,assign) CGRect   backgroundImageViewFrame;
@property (nonatomic,strong) NSString *backgroundImageName;

@property (nonatomic,strong) NSString *labelTitleStr;
@property (nonatomic,assign) CGRect    labelFrm;

@property (nonatomic,assign) BOOL      haveLftBtn;
@property (nonatomic,assign) CGRect    lftBtnFrm;
@property (nonatomic,strong) NSString  *lftBtnImgName;

@property (nonatomic,assign) BOOL       haveRhtBtn;
@property (nonatomic,assign) CGRect     rhtBtnFrm;
@property (nonatomic,strong) NSString   *rhtBtnImgName;


- (id)initWithFrame:(CGRect)frame bgImageName:(NSString *)bgimgName labelTitle:(NSString *)title labFrame:(CGRect)labelFrame leftBool:(BOOL)haveLeftBtn leftBtnFrame:(CGRect)leftBtnFrm leftBtnImageName:(NSString *)LeftBtnImgName rightBool:(BOOL)haveRightBtn rightBtnFrame:(CGRect)rightBtnFrm rightBtnImageName:(NSString *)rightBtnImgName;

@end
@protocol NavigationControllerDelegate <NSObject>

@optional
- (void)itemButtonClicked:(int)index;
@end
