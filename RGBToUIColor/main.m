//
//  main.c
//  RGBToUIColor
//
//  Created by Chris Eidhof on 04/11/13.
//  Copyright (c) 2013 Chris Eidhof. All rights reserved.
//

#include <stdio.h>
#import <stdlib.h>
#import <Foundation/Foundation.h>

// Variant of http://stackoverflow.com/questions/3805177/how-to-convert-hex-rgb-color-codes-to-uicolor
void SKScanHexColor(NSString * hexString, float * red, float * green, float * blue, float * alpha) {
    NSString *cleanString = [hexString stringByReplacingOccurrencesOfString:@"#" withString:@""];
    if([cleanString length] == 3) {
        cleanString = [NSString stringWithFormat:@"%@%@%@%@%@%@",
                                                 [cleanString substringWithRange:NSMakeRange(0, 1)],[cleanString substringWithRange:NSMakeRange(0, 1)],
                                                 [cleanString substringWithRange:NSMakeRange(1, 1)],[cleanString substringWithRange:NSMakeRange(1, 1)],
                                                 [cleanString substringWithRange:NSMakeRange(2, 1)],[cleanString substringWithRange:NSMakeRange(2, 1)]];
    }
    if([cleanString length] == 6) {
        cleanString = [cleanString stringByAppendingString:@"ff"];
    }

    unsigned int baseValue;
    [[NSScanner scannerWithString:cleanString] scanHexInt:&baseValue];

    if (red) { *red = ((baseValue >> 24) & 0xFF); }
    if (green) { *green = ((baseValue >> 16) & 0xFF); }
    if (blue) { *blue = ((baseValue >> 8) & 0xFF); }
    if (alpha) { *alpha = ((baseValue >> 0) & 0xFF); }
}
int main(int argc, const char * argv[])
{

    if (argc != 2) {
        fprintf(stderr, "Usage: cvt_hex #rrggbb");
        return EXIT_FAILURE;
    }

    NSString* hexString = [NSString stringWithCString:argv[1] encoding:NSUTF8StringEncoding];

    float red, green, blue, alpha;
    SKScanHexColor(hexString, &red, &green, &blue, &alpha);

    printf("return [UIColor colorWithRed:%g/255.0f green:%g/255.0f blue:%g/255.0f alpha:%g/255.0f]; // %s", red, green, blue, alpha, argv[1]);

    return 0;
}
