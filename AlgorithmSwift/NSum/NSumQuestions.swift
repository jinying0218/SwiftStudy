//
//  NSumQuestions.swift
//  AlgorithmSwift
//
//  Created by JYY on 2022/4/11.
//

import Foundation

//MARK: - 1. 两数之和 https://leetcode-cn.com/problems/two-sum/

class Solution1 {
    func twoSum(_ nums: [Int], _ target: Int) -> [Int] {
        var dict = [Int:Int]()
                    
        for (index,num) in nums.enumerated() {
            /// 数组元素作为key，索引作为value
            dict.updateValue(index, forKey: num)
        }
        
        for (index,num) in nums.enumerated() {
            let another = target - num
            /// 判断另一个数是否在字典的allKey中
            if dict.keys.contains(another) {
                let anotherIndex = dict[another]
                /// 得到的索引不等于当前索引
                if anotherIndex != index {
                    return [index,anotherIndex!]
                }
            }
        }
        return [-1,-1]
    }
}
