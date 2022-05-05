//
//  Stack.swift
//  AlgorithmSwift
//
//  Created by YY on 2022/4/13.
//

import Foundation


//MARK: - 20. 有效的括号 https://leetcode-cn.com/problems/valid-parentheses/

class Solution20 {
    func isValid(_ s: String) -> Bool {
        if s.count%2 != 0 {
            return false
        }
        let validDict: [Character:Character] = ["(":")","[":"]","{":"}"]
        var stack = [Character]()
        for c:Character in s {
//            print("\t \(c)")
            if validDict.keys.contains(c) {
                /// 左括号
                stack.append(c)
            }else {
                if stack.isEmpty {
                    return false
                }
                /// 右括号
                let rightValue = validDict[stack.last!]
                if rightValue == c {
                    stack.popLast()
                }else {
                    return false
                }
            }
//            print("stack: \(stack)")
        }
        if stack.isEmpty {
            return true
        }
        return false
    }
}

// MARK: - 155. 最小栈 https://leetcode-cn.com/problems/min-stack/
class MinStack {

    var stack: [Int]
    var minStack: [Int]
    
    init() {
        stack = []
        minStack = []
    }
    
    func push(_ val: Int) {
        stack.append(val)
        minStack.append(min(minStack.last ?? val, val))
        
        print("push:\(val) stack:\(stack)")
        print("push:\(val) minStack:\(minStack)")
    }
    
    func pop() {
        stack.popLast()
        minStack.popLast()
        print("POP  stack:\(stack)")
        print("POP  minStack:\(minStack)")
    }
    
    func top() -> Int {
        let val = stack.last
        print("top:\(String(describing: val!))")
        return val!
    }
    
    func getMin() -> Int {
        let val = minStack.last
        print("getMin:\(String(describing: val!))")
        return val!
    }
}

//"(),[],{}"
//"(}"
//"[}"
//"({[]{}})"

/*
 ["MinStack","push","push","push","top","pop","getMin","pop","getMin","pop","push","top","getMin","push","top","getMin","pop","getMin"]
 [[],[2147483646],[2147483646],[2147483647],[],[],[],[],[],[],[2147483647],[],[],[-2147483648],[],[],[],[]]
 
 [null,null,null,null,2147483647,null,2147483646,null,2147483646,null,null,2147483647,2147483646,null,-2147483648,-2147483648,null,2147483646]
 [null,null,null,null,2147483647,null,2147483646,null,2147483646,null,null,2147483647,2147483647,null,-2147483648,-2147483648,null,2147483647]
 
 ["MinStack","push","push","getMin","getMin","push","getMin","getMin","top","getMin","pop","push","push","getMin","push","pop","top","getMin","pop"]
 [[],[-10],[14],[],[],[-20],[],[],[],[],[],[10],[-7],[],[-7],[],[],[],[]]
 
 */
func StackOperate() {
    
//    let s = MinStack()
//    s.push(2147483646)
//    s.push(2147483646)
//    s.push(2147483647)
//    s.top()
//    s.pop()
//    s.getMin()
//    s.pop()
//    s.getMin()
//    s.pop()
//    s.push(2147483647)
//    s.top()
//    s.getMin()
//    s.push(-2147483648)
//    s.top()
//    s.getMin()
//    s.pop()
//    s.getMin()
    
    
    let stack = MinStack()
    stack.push(-10)
    stack.push(14)
    stack.getMin()
    stack.getMin()
    stack.push(-20)
    stack.getMin()
    stack.getMin()
    stack.top()
    stack.getMin()
    stack.pop()
    stack.push(10)
    stack.push(-7)
    stack.getMin()
    stack.push(-7)
    stack.pop()
    stack.top()
    stack.getMin()
    stack.pop()

}
