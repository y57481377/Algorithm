//
//  main.cpp
//  最长公共前缀
//
//  Created by ijm on 9/21/20.
//  Copyright © 2020 ijiami. All rights reserved.
//

#include <iostream>
#include <string>
#include <vector>

using namespace std;

// 排序法， 排序后只需要比较 首尾两字符串的公共部分
string longestCommonPrefix(vector<string>& strs) {
    if (strs.empty())
        return "";
    
    sort(strs.begin(), strs.end());

    string first = strs.front();
    string last = strs.back();
    
    int l = min(first.size(), last.size());
    int i = 0;
    while (first[i] == last[i] && i < l) {
        i++;
    }
    return first.substr(0, i);
}

// 纵向比较法
string longestCommonPrefix1(vector<string>& strs) {
    if (strs.empty())
        return "";
    
    int length = strs[0].size();
    int count = strs.size();
    for (int i = 0; i < length; i++) {
        char c = strs[0][i];
        for (int j = 1; j < count; j++) {
            if (i == strs[j].size() || strs[j][i] != c) {
                return strs[0].substr(0, i);
            }
        }
    }
    return strs[0];
}

// 横向比较法
string longestCommonPrefix2(vector<string>& strs) {
    
    return NULL;
}
/** 编写一个函数来查找字符串数组中的最长公共前缀。
 *  如果不存在公共前缀，返回空字符串 ""。
 */

int main(int argc, const char * argv[]) {
    // insert code here...
    std::cout << "Hello, World!\n";
    
    vector<string> vec = vector<string>();
    string temp;
        
    vec.front();
    vec.back();
    vec.push_back(string("flower"));
    vec.push_back(string("flow"));
    vec.push_back(string("flight"));
    
    string sub = longestCommonPrefix(vec);
    
    string sub1 = longestCommonPrefix1(vec);
    cout << sub1 << endl;
    
    return 0;
}
