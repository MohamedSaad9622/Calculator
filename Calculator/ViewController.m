//
//  ViewController.m
//  Calculator
//
//  Created by MAC on 25/05/2022.
//

#import "ViewController.h"


@interface ViewController ()

@property (weak, nonatomic) IBOutlet UILabel *my_label_1;
@property (weak, nonatomic) IBOutlet UILabel *my_label_2;



- (IBAction)AC_button:(id)sender;
- (IBAction)mul_button:(id)sender;
- (IBAction)square_button:(id)sender;
- (IBAction)div_button:(id)sender;
- (IBAction)add_button:(id)sender;
- (IBAction)sub_button:(id)sender;
- (IBAction)equal_button:(id)sender;
- (IBAction)dot_button:(id)sender;
- (IBAction)zero_button:(id)sender;
- (IBAction)one_button:(id)sender;
- (IBAction)two_button:(id)sender;
- (IBAction)three_button:(id)sender;
- (IBAction)four_button:(id)sender;
- (IBAction)five_button:(id)sender;
- (IBAction)six_button:(id)sender;
- (IBAction)seven_button:(id)sender;
- (IBAction)eight_button:(id)sender;
- (IBAction)nine_button:(id)sender;


//function________________
+(void)my_main:(char)operation;
+(float)add:(float)num1 to:(float)num2;
+(float)sub:(float)num1 from:(float)num2;
+(float)mul:(float)num1 by:(float)num2;
+(float)div:(float)num1 on:(float)num2;
+(double)square:(float)num1;



@end

@implementation ViewController

float num1,num2,result;
char operation,hide_equal_button = 'n';

- (void)viewDidLoad {
    [super viewDidLoad];
}


- (IBAction)AC_button:(id)sender {
    _my_label_1.text = @"";
    _my_label_2.text = @"";
    [_my_label_1 setHidden:false];
    [_my_label_2 setHidden:true];
    num1 = num2 = 0.0;
    operation = 'n';
}

- (IBAction)nine_button:(id)sender {
    _my_label_1.text = [_my_label_1.text stringByAppendingString: @"9"];
    [_my_label_1 setHidden:false];
    [_my_label_2 setHidden:true];
}

- (IBAction)eight_button:(id)sender {
    _my_label_1.text = [_my_label_1.text stringByAppendingString: @"8"];
    [_my_label_1 setHidden:false];
    [_my_label_2 setHidden:true];
}

- (IBAction)seven_button:(id)sender {
    _my_label_1.text = [_my_label_1.text stringByAppendingString: @"7"];
    [_my_label_1 setHidden:false];
    [_my_label_2 setHidden:true];
}

- (IBAction)six_button:(id)sender {
    _my_label_1.text = [_my_label_1.text stringByAppendingString: @"6"];
    [_my_label_1 setHidden:false];
    [_my_label_2 setHidden:true];
}

- (IBAction)five_button:(id)sender {
    _my_label_1.text = [_my_label_1.text stringByAppendingString: @"5"];
    [_my_label_1 setHidden:false];
    [_my_label_2 setHidden:true];
}

- (IBAction)four_button:(id)sender {
    _my_label_1.text = [_my_label_1.text stringByAppendingString: @"4"];
    [_my_label_1 setHidden:false];
    [_my_label_2 setHidden:true];
}

- (IBAction)three_button:(id)sender {
    _my_label_1.text = [_my_label_1.text stringByAppendingString: @"3"];
    [_my_label_1 setHidden:false];
    [_my_label_2 setHidden:true];
}

- (IBAction)two_button:(id)sender {
    _my_label_1.text = [_my_label_1.text stringByAppendingString: @"2"];
    [_my_label_1 setHidden:false];
    [_my_label_2 setHidden:true];
}

- (IBAction)one_button:(id)sender {
    _my_label_1.text = [_my_label_1.text stringByAppendingString: @"1"];
    [_my_label_1 setHidden:false];
    [_my_label_2 setHidden:true];
}

- (IBAction)zero_button:(id)sender {
    _my_label_1.text = [_my_label_1.text stringByAppendingString: @"0"];
    [_my_label_1 setHidden:false];
    [_my_label_2 setHidden:true];
}

- (IBAction)dot_button:(id)sender {
    if(_my_label_1.text.length == 0){
        _my_label_1.text = @"0.";
    }else{
        _my_label_1.text = [_my_label_1.text stringByAppendingString: @"."];
    }
    [_my_label_1 setHidden:false];
    [_my_label_2 setHidden:true];
}





- (IBAction)equal_button:(id)sender {
    if(operation != 'n'){
        if(_my_label_1.text.length != 0){
            num2 = [_my_label_1.text doubleValue];
        }
        
        if (operation != 's') {
            _my_label_2.text = [_my_label_2.text stringByAppendingString: _my_label_1.text];
        }

        _my_label_2.text = [_my_label_2.text stringByAppendingString: @" = "];
        
        if(operation == '/' && num2 == 0 ){
            _my_label_2.text = [_my_label_2.text stringByAppendingString:@"Error"];
        }else{
            [ViewController my_main:operation];
            _my_label_2.text = [_my_label_2.text stringByAppendingString:@(result).stringValue];
        }

        [_my_label_1 setHidden:true];
        [_my_label_2 setHidden:false];
        operation = 'n';
        _my_label_1.text = @"";
    }
    
}




- (IBAction)sub_button:(id)sender {
    if (_my_label_1.text.length == 0) {
        num1 = result;
        _my_label_2.text = [@(result).stringValue stringByAppendingString: @" - "];
    }else{
        num1 = [_my_label_1.text doubleValue];
        _my_label_2.text = [_my_label_1.text stringByAppendingString: @" - "];
    }
    operation = '-';
    _my_label_1.text = @"";
}

- (IBAction)add_button:(id)sender {
    if (_my_label_1.text.length == 0) {
        num1 = result;
        _my_label_2.text = [@(result).stringValue stringByAppendingString: @" + "];
    }else{
        num1 = [_my_label_1.text doubleValue];
        _my_label_2.text = [_my_label_1.text stringByAppendingString: @" + "];
    }
    
    operation = '+';
    _my_label_1.text = @"";
}

- (IBAction)div_button:(id)sender {
    if (_my_label_1.text.length == 0) {
        num1 = result;
        _my_label_2.text = [@(result).stringValue stringByAppendingString: @" ÷ "];
    }else{
        num1 = [_my_label_1.text doubleValue];
        _my_label_2.text = [_my_label_1.text stringByAppendingString: @" ÷ "];
    }
    
    operation = '/';
    _my_label_1.text = @"";
}

- (IBAction)square_button:(id)sender {
    if (_my_label_1.text.length == 0) {
        num1 = result;
        _my_label_2.text = [@(result).stringValue stringByAppendingString: @"² "];
    }else{
        num1 = [_my_label_1.text doubleValue];
        _my_label_2.text = [_my_label_1.text stringByAppendingString: @"² "];
    }
    operation = 's';
    _my_label_1.text = @"";
}

- (IBAction)mul_button:(id)sender {
    if (_my_label_1.text.length == 0) {
        num1 = result;
        _my_label_2.text = [@(result).stringValue stringByAppendingString: @"x "];
    }else{
        num1 = [_my_label_1.text doubleValue];
        _my_label_2.text = [_my_label_1.text stringByAppendingString: @"x "];
    }
    operation = 'x';
    _my_label_1.text = @"";
    
}


//function---------------------------------

+ (float)add:(float)num1 to:(float)num2{
    return num1+num2;
}

+ (float)sub:(float)num1  from:(float)num2{
    return num1-num2;
}

+ (float)mul:(float)num1  by:(float)num2{
    return num1*num2;
}

+ (float)div:(float)num1  on:(float)num2{
    return num1/num2;
}

+ (double)square:(float)num{
    return  num1*num1;
}

+ (void)my_main:(char)operation{
    switch (operation) {
        case '+':
            result = [ViewController add:num1 to:num2];
            break;
        case '-':
            result = [ViewController sub:num1  from:num2];
            break;
        case 'x':
            result = [ViewController mul:num1  by:num2];
            break;
        case '/':
            if (num2 != 0) {
                result = [ViewController div:num1  on:num2];
            }
            break;
        case 's':
            result = [ViewController square:num1];
            break;
    }
}
@end
