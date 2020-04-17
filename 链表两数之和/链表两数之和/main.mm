//
//  main.m
//  链表两数之和
//
//  Created by ijm on 4/17/20.
//  Copyright © 2020 ijiami. All rights reserved.
//

#import <Foundation/Foundation.h>
#include <iostream>
#include <vector>

using namespace std;

struct ListNode
{
    int num;
    ListNode *next;
    ListNode(int x) : num(x), next(NULL) {}
};


ListNode * setupListNode(int num)
{
    ListNode *node = NULL;
    
    int mm = num;
    int i = 10;
    float f = 1.0;
    while (f >= 1) {
        f = mm / 10.0;
        int b = mm % i;
        ListNode *temp = new ListNode(b);
        temp->next = node;
        node = temp;
        mm = mm / i;
    }
    return node;
}

int sumTowListNode(ListNode *l1, ListNode *l2)
{
    int result = 0;
    
    ListNode *temp1 = l1;
    ListNode *temp2 = l2;
    
    bool bl1 = temp1->next != NULL;
    bool bl2 = temp2->next != NULL;
    
    
    vector<int> vl1;
    vector<int> vl2;
    while (temp1 || temp2) {
        
        if (temp1) {
            vl1.push_back(temp1->num);
            temp1 = temp1->next;
        }else {
            vl1.push_back(0);
        }
        
        if (temp2) {
            vl2.push_back(temp2->num);
            temp2 = temp2->next;
        }else {
            vl2.push_back(0);
        }
    }
    
    vector<int>::size_type size = vl1.size();
    int e = 1;
    for (int i = 0; i < size; i++) {
        int nl1 = vl1[i];
        int nl2 = vl2[i];
        
        int flag = (nl1 + nl2) * 0.1;
        int tempNum = ((nl1 + nl2) % 10) * e + flag * e * 10;
        result += tempNum;
        
        e *= 10;
    }
    
    return result;
}

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // insert code here...
        int n, m;
        
        cin >> n;
        cin >> m;
        
        ListNode *nList = setupListNode(n);
        ListNode *mList = setupListNode(m);
        
        cout << "sum:" << sumTowListNode(nList, mList) << endl;
        NSLog(@"Hello, World!");
    }
    return 0;
}
