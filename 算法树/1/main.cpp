//
//  main.cpp
//  1-1.5类的简介
//
//  Created by ijm on 3/10/20.
//  Copyright © 2020 ijiami. All rights reserved.
//

#include <iostream>
#include <string>
#include <cmath>


//题目描述
//假定一种编码的编码范围是a ~ y的25个字母，从1位到4位的编码，如果我们把该编码按字典序排序，形成一个数组如下： a, aa, aaa, aaaa, aaab, aaac, … …, b, ba, baa, baaa, baab, baac … …, yyyw, yyyx, yyyy 其中a的Index为0，aa的Index为1，aaa的Index为2，以此类推。 编写一个函数，输入是任意一个编码，输出这个编码对应的Index.
//输入描述:
//输入一个待编码的字符串,字符串长度小于等于100.
//输出描述:
//输出这个编码的index
//示例1
//输入
//baca
//输出
//16331

using namespace std;
int global_int;

int main(int argc, const char * argv[]) {
    // insert code here...
    std::cout << "Hello, World!\n";
    
    string word;
    int size = 4;
    while (cin >> word) {
        cout << word << endl;
        for (int i = 0; i < word.size(); i++) {
            if (word[i] < 'a' || word[i] > 'y') {
                printf("word error");
                break;
            }
        }
        
        int index = 0;
        for (int i = 0; i < word.size(); i++) {
            for (int j = 0; j <= i; j++) {
                if (i == j) {
                    index += (word[j] - 'a' + 1);
                }else {
                    index += (word[j] - 'a') * pow(25, i - j);
                }
            }
        }
        printf("index: %d\n", index - 1);
    }
    
    
    
//    Sales_item book;
//    std::cin >> book;
//    std::cout << book << std::endl;
    
    
//    Sales_item item1, item2;
//    std::cin >> item1 >> item2;
//    std::cout << item1 + item2 << std::endl;
    
//    Sales_item book1, book2;
//    while (std::cin >> book1) {
//        book2 = book1 + book2;
//        std::cout << book2 << std::endl;
    
    
    std::cout << "2M\n" << std::endl;
    std::cout << "2\tM\n" << std::endl;
    
    int local_int;
    std::string local_str;
    
    
    int ival = 1.01;
    const int &rval3 = 1;
    int &rval2 = ival;
    
    rval2 = 3.14;
    rval2 = rval3;
    ival = rval3;
    
    return 0;
}
