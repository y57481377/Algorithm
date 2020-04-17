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

ListNode * sumTowListNode(ListNode *l1, ListNode *l2)
{
    ListNode * result = new ListNode(-1);
    ListNode * head = result;
//    ListNode *temp1 = l1;
//    ListNode *temp2 = l2;
      
      // 进位
      int carry = 0;
      while (l1 || l2) {
          int s = 0;
          if (l1) {
              s += l1->num;
              l1 = l1->next;
          }
          if (l2) {
              s += l2->num;
              l2 = l2->next;
          }
          // 如果有进位需要再加1
          if (carry) {
              s++;
          }
          result->next = new ListNode(s % 10);
          result = result->next;
          carry = (s >= 10 ? 1 : 0);
      }
    
    return head->next;
//    vector<int> vl1;
//    vector<int> vl2;
//    while (temp1 || temp2) {
//
//        if (temp1) {
//            vl1.push_back(temp1->num);
//            temp1 = temp1->next;
//        }else {
//            vl1.push_back(0);
//        }
//
//        if (temp2) {
//            vl2.push_back(temp2->num);
//            temp2 = temp2->next;
//        }else {
//            vl2.push_back(0);
//        }
//    }
//
//    vector<int>::size_type size = vl1.size();
//    int e = 1;
//    for (int i = 0; i < size; i++) {
//        int nl1 = vl1[i];
//        int nl2 = vl2[i];
//
//        int flag = (nl1 + nl2) * 0.1;
//        int tempNum = ((nl1 + nl2) % 10) * e + flag * e * 10;
//        result += tempNum;
//
//        e *= 10;
//    }
    
//    return result;
}

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // insert code here...
        int n, m;
        
        cin >> n;
        cin >> m;
        
        ListNode *nList = setupListNode(n);
        ListNode *mList = setupListNode(m);
        
        ListNode *rel = sumTowListNode(nList, mList);
        while (rel) {
            cout << rel->num;
            if (rel->next) {
                cout << "->";
            }
            rel = rel->next;
        }
    }
    return 0;
}
