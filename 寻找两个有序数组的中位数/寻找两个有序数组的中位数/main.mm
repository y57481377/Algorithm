//
//  main.m
//  寻找两个有序数组的中位数
//
//  Created by ijm on 4/20/20.
//  Copyright © 2020 ijiami. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <iostream>
#import <vector>

using namespace std;



NSArray *merge1(NSArray<NSNumber *> *arrA, NSArray<NSNumber *> *arrB) {
    
    NSInteger lenA = arrA.count;
    NSInteger lenB = arrB.count;
    NSMutableArray *rel = [NSMutableArray arrayWithCapacity:lenA + lenB];
    int i = 0, j = 0, k = 0;
    
    while (i < lenA && j < lenB) {
        if (arrA[i].intValue <= arrB[j].intValue) {
            rel[k++] = arrA[i++];
        } else {
            rel[k++] = arrB[j++];
        }
    }
    
    while (i < lenA)
        rel[k++] = arrA[i++];
    
    while (j < lenB) {
        rel[k++] = arrB[j++];
    }
    
    return rel.copy;
}

/** 给定两个大小为m和n的正序（从小到大）数组nums1和nums2。
 *  请你找出这两个正序数组的中位数，并且要求算法的时间复杂度为O(log(m+n))。
 *  你可以假设num1和nums2不会同时为空
 */

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // insert code here...
        
        int a[4] = {1, 4, 6, 9};
        int b[3] = {2, 3, 10};
        
        int r[7] = {0};
        
        vector<int> ad = vector<int>();
        
        
        
        int al = 4, bl = 3;
        int i = 0, j = 0, k = 0;
        while (i < al && j < bl) {
            
            if (a[i] <= b[j]) {
                r[k++] = a[i++];
            }else {
                r[k++] = b[j++];
            }
        }
        
        while (i < al) {
            r[k++] = a[i++];
        }
        
        while (j < bl) {
            r[k++] = b[j++];
        }
        
        k = 0;
        while (k < 7) {
            cout << r[k++] << " ";
        }
        
        
        
        NSArray<NSNumber *> *arr = merge1(@[@1, @4, @6, @9], @[@2, @3,@10]);
        
        int result = 0;
        if (arr.count % 2 == 0) {
            result = (arr[(arr.count - 1) / 2].intValue + arr[arr.count / 2].intValue) / 2.0;
        }else {
            result = arr[arr.count / 2].intValue;
        }
        NSLog(@"%@", arr);
        NSLog(@"result: %d", result);
        
    }
    return 0;
}
