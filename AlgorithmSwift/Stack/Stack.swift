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

//"(),[],{}"
//"(}"
//"[}"
//"({[]{}})"
func StackOperate() {
    
//    print (Solution20().isValid("}{"))
}
