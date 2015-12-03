//
//  LoginViewController.m
//  Register
//
//  Created by lmj on 15-10-4.
//
//

#import "LoginViewController.h"
#import "Common.h"
#import "NavigationController.h"
#import "Utils.h"
#import "RegisterViewController.h"

@interface LoginViewController ()

@property (nonatomic,strong) UITableView *tableView;

@property (nonatomic,strong) NavigationController *navBar;

@end

@implementation LoginViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    //    [self createNavigation];
    [self createNavigation];
    [self createTableview];
    
}

/**
 *	@brief	创建自定义导航条
 */
- (void)createNavigation
{
    _navBar = [[NavigationController alloc] initWithFrame:CGRectMake(0.f, 0.f, 320.f,64.f)
                                              bgImageName:@"backgroundNavbar_ios7"
                                               labelTitle:@"登陆"
                                                 labFrame:CGRectMake(90.f,22.f, 140.f, 30.f)
                                                 leftBool:YES
                                             leftBtnFrame:CGRectMake(12.f,15.f, 54, 44)
                                         leftBtnImageName:@"icon_back_w.png"
                                                rightBool:YES
                                            rightBtnFrame:CGRectMake(256.f,15.f, 50, 50)
                                        rightBtnImageName:@"user_register.png"];
    _navBar.delegate = self;

    [self.view addSubview:_navBar];
    
}

- (void)createTableview
{
    _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0.f, (FSystenVersion >= 7.0)?64.f:44.f, 320.f, (FSystenVersion >=7.0)?(ISIPHONE5?(568.f - 64.f):(480.f - 64.f)):(ISIPHONE5?(548.f - 44.f):(460.f - 44.f))) style:UITableViewStyleGrouped];
    _tableView.allowsSelection = NO;
    _tableView.delegate = self;
    _tableView.dataSource = self;
    [_tableView setBackgroundColor:[Common translateHexStringToColor:@"#f0f0f0"]];
    [self.view addSubview:_tableView];
    //    self.tableView=({
    //        UITableView *tableView=[[UITableView alloc] initWithFrame:CGRectMake(0,0,self.view.bounds.size.width,self.tableViewHeith) style:UITableViewStylePlain];
    //        tableView.delegate=self;
    //        tableView.dataSource=self;
    //        tableView.allowsSelection = NO;
    //        tableView.separatorStyle=UITableViewCellSeparatorStyleNone;
    //        [tableView setBackgroundColor:[Common translateHexStringToColor:@"#f0f0f0"]];
    //        [self.view addSubview:tableView];
    //        tableView;
    //    });
}
#pragma mark - TopNavBarDelegate Method
/**
 *	@brief	TopNavBarDelegate Method
 *
 *	@param 	index 	barItemButton 的索引值
 */
- (void)itemButtonClicked:(int)index
{
 
    switch (index) {
        case 0:
        {
            [Utils alertTitle:@"提示" message:@"您点击了返回按钮" delegate:nil cancelBtn:@"取消" otherBtnName:nil];
        }
            break;
        case 1:
        {
            LoginViewController *login =[[LoginViewController alloc] init];
            RegisterViewController  *reg = [[RegisterViewController alloc] init];
            [self presentViewController:reg animated: YES completion:nil];
         
        }
            break;
            
        default:
            break;
    }
}
#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 3;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 1;
}


//
//- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
//{
//    return 12;
//}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *ID = @"cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:ID];
    }
    
    if (indexPath.section == 0)
    {
        cell.imageView.image = [UIImage imageNamed:@"user_user"];
        UITextField *textField= [[UITextField alloc] initWithFrame:CGRectMake(50.f, 12.f, 220.f, 21.f)];
        textField.tag = Tag_UserTextField;
        textField.returnKeyType = UIReturnKeyDone;
        textField.delegate = self;
        textField.placeholder = @"用户名";
        textField.keyboardType = UIKeyboardTypeEmailAddress;
        [cell addSubview:textField];
        //        cell.textLabel.text = [NSString stringWithFormat:@"消息测试数据----%d", indexPath.row];
    }
    else if (indexPath.section == 1){
        
        cell.imageView.image = [UIImage imageNamed:@"user_password"];
        UITextField *textField = [[UITextField alloc] initWithFrame:CGRectMake(50.f, 12.f, 220.f, 21.f)];
        textField.tag = Tag_PasswordTextField;
        textField.returnKeyType = UIReturnKeyDone;
        textField.secureTextEntry = YES;
        textField.delegate = self;
        textField.placeholder = @"密码";
        [cell addSubview:textField];
        
        
    }
    else if (indexPath.section == 2){
        UIButton *registerBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        registerBtn.frame = CGRectMake(([Common IOSVersion] >= 7.0)?0.f:10.f, 0.f, ([Common IOSVersion]>=7.0)?320.f:300.f, 44.f);
        [registerBtn addTarget:self action:@selector(registerBtnClicked:) forControlEvents:UIControlEventTouchUpInside];
        [registerBtn setBackgroundImage:[UIImage imageNamed:@"user_btn"] forState:UIControlStateNormal];
        [registerBtn setTitle:@"提交" forState:UIControlStateNormal];
        [registerBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        registerBtn.titleLabel.font = [UIFont systemFontOfSize:18.f];
        [registerBtn setContentHorizontalAlignment:UIControlContentHorizontalAlignmentCenter];
        
        [cell addSubview:registerBtn];
    }
    //cell.textLabel.text = [NSString stringWithFormat:@"消息测试数据----%d", indexPath.row];
    return cell;
}



#pragma mark - UITableViewDelegate
- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section{
    return nil;
}


-(CGFloat)tableView:(UITableView*)tableView heightForHeaderInSection:(NSInteger)section
{
    return 5.0;
}


-(CGFloat)tableView:(UITableView*)tableView heightForFooterInSection:(NSInteger)section
{
    if (section == 0) {
        return 1.f;
    }else{
        
        return 5.f;
    }
}

-(UIView*)tableView:(UITableView*)tableView viewForHeaderInSection:(NSInteger)section
{
    return [[UIView alloc] initWithFrame:CGRectZero];
}

#pragma mark - RegisterBtnClicked Method
- (void)registerBtnClicked:(id)sender{
    
    if ([self checkValidityTextField]) {
        
        [Utils alertTitle:@"提示" message:@"您输入的用户名有误" delegate:nil cancelBtn:@"确定" otherBtnName:nil];
    }
    
    
}
/**
 *	@brief	验证文本框是否为空
 */
#pragma mark checkValidityTextField Null
- (BOOL)checkValidityTextField
{
    
    
    if ([(UITextField *)[self.view viewWithTag:Tag_UserTextField] text] == nil || [[(UITextField *)[self.view viewWithTag:Tag_UserTextField] text] isEqualToString:@""]) {
        
        [Utils alertTitle:@"提示" message:@"用户名不能为空" delegate:self cancelBtn:@"取消" otherBtnName:nil];
        
        return NO;
    }
    if ([(UITextField *)[self.view viewWithTag:Tag_PasswordTextField] text] == nil || [[(UITextField *)[self.view viewWithTag:Tag_PasswordTextField] text] isEqualToString:@""]) {
        
        [Utils alertTitle:@"提示" message:@"用户密码不能为空" delegate:self cancelBtn:@"取消" otherBtnName:nil];
        
        return NO;
    }
    
    
    return YES;
    
}


#pragma mark - UITextFieldDelegate Method

- (void)textFieldDidBeginEditing:(UITextField *)textField{
    
    
}

- (void)textFieldDidEndEditing:(UITextField *)textField{
    
    switch (textField.tag) {
        case Tag_UserTextField:
        {
            
            if ([textField text] != nil && [[textField text] length]!= 0) {
                
                if ([[textField text] length] < 6) {
                    
                    [Utils alertTitle:@"提示" message:@"用户名小于6位！" delegate:nil cancelBtn:@"取消" otherBtnName:nil];
                }
            }
        }
            break;
        case Tag_PasswordTextField:
        {
            
            if ([textField text] != nil && [[textField text] length]!= 0) {
                
                if ([[textField text] length] < 6) {
                    
                    [Utils alertTitle:@"提示" message:@"用户密码小于6位！" delegate:nil cancelBtn:@"取消" otherBtnName:nil];
                }
            }
        }
        default:
            break;
    }
}
- (BOOL)textFieldShouldReturn:(UITextField *)textField{
    
    [textField resignFirstResponder];
    
    return YES;
}

#pragma mark - touchMethod
-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    
    [super touchesBegan:touches withEvent:event];
    
    [self allEditActionsResignFirstResponder];
}

#pragma mark - PrivateMethod
- (void)allEditActionsResignFirstResponder{
    
    
    //用户名
    [[self.view viewWithTag:Tag_UserTextField] resignFirstResponder];
    //temp密码
    [[self.view viewWithTag:Tag_PasswordTextField] resignFirstResponder];
    
    
}


@end
