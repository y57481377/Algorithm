//
//  main.m
//  两数之和
//
//  Created by ijm on 4/15/20.
//  Copyright © 2020 ijiami. All rights reserved.
//

#import <Foundation/Foundation.h>
#include <vector>
#include <map>
#include <iostream>


using namespace std;

// 一遍hash表
vector<int> twoSum(vector<int>& nums, int target) {
    
    map<int, int> temp;
    
    for(int i = 0; i < nums.size(); i++) {
        
        int n = nums[i];
        
        // 目标数
        int p = target - n;
        if (temp.find(p) != temp.end()) {
            vector<int> result;
            result.push_back(temp[p]);
            result.push_back(i);
            return result;
        }
        temp[n] = i;
    }
    
    return nums;
}

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // insert code here...
        NSLog(@"Hello, World!");
//        int n;
        
        int n[8] = {2, 1, 5, 6, 3, 9, 7};
        
        vector<int> nums(n, n+8);
//        while (cin >> n) {
//            nums.push_back(n);
//        }
        
        vector<int> result = twoSum(nums, 9);
        
        cout << result[0] << " " << result[1] << endl;
    }
    return 0;
}
