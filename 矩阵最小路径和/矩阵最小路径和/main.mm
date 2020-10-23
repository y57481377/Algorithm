//
//  main.m
//  矩阵最小路径和
//
//  Created by ijm on 4/14/20.
//  Copyright © 2020 ijiami. All rights reserved.
//

#import <Foundation/Foundation.h>
#include <string>
#include <vector>
//#include <cmath>
#include <iostream>
using namespace std;
//4 4
//1 3 5 2
//5 0 3 8
//8 5 6 1
//0 2 1 0

int minPath(vector<vector<int>> sq);

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // insert code here...
        // 输入 n行、m列
        int n, m;
        cin >> n;
        cin >> m;
        
        vector<vector<int>> sq;
        
        //输入矩阵
        for (int i = 0; i < n; i++) {
            vector<int> line;
            for (int j = 0; j < m; j++) {
                int inNum;
                cin >> inNum;
                line.push_back(inNum);
            }
            sq.push_back(line);
        }
        cout << "打印矩阵" << endl;
        // 输出矩阵打印
        for (int i = 0; i < n; i++) {
            for (int j = 0; j < m; j++) {
                cout << sq[i][j] << " ";
            }
            cout << endl;
        }
        
        // 求最小路径和
        cout << minPath(sq) << endl;
        NSLog(@"Hello, World!");
    }
    return 0;
}

int minPath(vector<vector<int>> sq) {
    
    unsigned long n = sq.size();
    unsigned long m = sq.size();
    
    vector<vector<int>> path(n, vector<int>(m, 0));
    path[0][0] = sq[0][0];
    
    for (int i = 0; i < n; i++)
    {
        for (int j = 0; j < m; j++)
        {
            int temp = sq[i][j];
            if (i == 0 && j == 0)
            {
                continue;
            }
            else if (i == 0)
            {
                path[i][j] = path[i][j-1] + temp;
            }
            else if (j == 0)
            {
                path[i][j] = path[i - 1][j] + temp;
            }
            else
            {
                path[i][j] = min(path[i - 1][j] + temp, path[i][j - 1] + temp);
            }
        }
    }
    
    for (int i = 0; i < n; i++) {
        for (int j = 0; j < m; j++) {
            cout << path[i][j] << " ";
        }
        cout << endl;
    }
    return path[m -1][n -1];
}
