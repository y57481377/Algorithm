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

struct LNode {
    int num;
    LNode *next;
    LNode(int n) : num(n), next(NULL) {}
};


LNode *setupLNode(int num) {
    LNode *node = NULL;
    
    int mm = num;
    int f = 1;
    while (f >= 1) {
        f = mm/10;
        LNode *temp = new LNode(mm%10);
        temp->next = node;
        node = temp;
        
        mm = mm/10;
    }
    return node;
}

LNode *sumTowLNode(LNode *nl, LNode *ml) {
    LNode *result = new LNode(0);
    LNode *head = result;
    LNode *temp = result;
    // 进位标志
    int carry = 0;
    while (nl || ml || carry) {
        int sum = 0;
        if (nl) {
            sum += nl->num;
            nl = nl->next;
        }
        
        if (ml) {
            sum += ml->num;
            ml = ml->next;
        }
        
        // 处理进位，如果有进位则链表上一位需要+1 （因为逆序）
        if (carry) {
            temp->num += 1;
        }
        
        carry = sum/10;
        // 判断sum是否为0，防止链表已经结束，但末尾有进位导致循环后而外增加0
        if (sum > 0) {
            result->next = new LNode(sum%10);
            temp = result;
            result = result->next;
        }
    }
    
     return head->num > 0 ? head : head->next;
};


/** 给出两个 非空 的链表用来表示两个非负的整数。其中，他们各自的位置是按照 逆序 的方式存储的，并且他们的每个节点只能存储 一位 数字。
 *  如果，我们将这两个数相加起来，则会返回一个新的链表来表示他们的和。
 *  可以假设出了数字0之外，这两个数都不会以0开头。
*/

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // insert code here...
        int n, m;
        
        cin >> n;
        cin >> m;
        
        LNode *nl = setupLNode(n);
        LNode *ml = setupLNode(m);
        
        LNode *result = sumTowLNode(nl, ml);
        while (result) {
            cout << result->num;
            if (result->next) {
                cout << "->";
            }
            result = result->next;
        }
    }
    return 0;
}
