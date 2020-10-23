//
//  main.m
//  无重复字符的最长子串
//
//  Created by ijm on 4/20/20.
//  Copyright © 2020 ijiami. All rights reserved.
//

#import <Foundation/Foundation.h>
#include <iostream>
#include <string>
#include <map>


using namespace std;

// 解法1:  滑动窗口hashmap
int lengthOfLongestSubstring1(string str)
{
    string substr;
    map<char, int> cmap;
    int begin = 0;
    for (int i = 0; i < str.length(); i++) {
        char c = str[i];
        if (cmap.find(c) != cmap.end()) {
            begin = max(cmap[c] + 1, begin);
        }
        cmap[c] = i;
        // i - begin + 1为字符串长度
        if (substr.length() < i - begin + 1) {
            // 如果比之前的长则覆盖前值
            substr = str.substr(begin, i - begin + 1);;
        }
        
    }
    return substr.length();
}

int lengthOfLongestSubstring2(string str)
{
    // 解法2
    char ascall[256] = {0};
    int start = 0, maxLength = 0;
    for (int i = 0; i < str.length(); i++) {
        // ascall[] 可直接作为循环的依据
        while(!ascall[(int)str[i]]) {
            ascall[(int)str[start]] = 0;
            start++;
        }
        ascall[(int)str[i]] = 1;
        maxLength = max(maxLength, i - start + 1);
    }
    return maxLength;
}

int main(int argc, const char * argv[]){
    @autoreleasepool {
        // insert code here...
        
        string str;
        cin >> str;
        
        
        cout << lengthOfLongestSubstring1(str) << endl;
        cout << lengthOfLongestSubstring2(str) << endl;
        
        NSLog(@"Hello, World!");
    }
    return 0;
}
