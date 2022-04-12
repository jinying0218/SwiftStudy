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

//MARK: - 15. 三数之和 https://leetcode-cn.com/problems/3sum/

class Solution15 {
    
    /// 有序数组使用
    func twoSum(_ nums: [Int], _ target: Int) -> [[Int]]? {
        var left = 0
        var right = nums.count - 1
        var res : [[Int]] = []
        while left < right {
            let leftValue = nums[left]
            let rightValue = nums[right]
            
            if (leftValue + rightValue) < target {
                while left < right && nums[left] == leftValue {
                    /// 去除重复数
                    left += 1
                }
            }else if (leftValue + rightValue) > target {
                while left < right && nums[right] == rightValue {
                    /// 去除重复数
                    right -= 1
                }
            }else {
                var temp: [Int] = []
                temp.append(leftValue)
                temp.append(rightValue)
                res.append(temp)
                while left < right && nums[left] == leftValue {
                    /// 去除重复数
                    left += 1
                }
                while left < right && nums[right] == rightValue {
                    /// 去除重复数
                    right -= 1
                }
            }
        }
        return res
    }
    
    func threeSum(_ nums: [Int]) -> [[Int]]? {
        
        guard nums.count > 0 && nums.count >= 3 else {
            /// 排序后如果第一个元素就大于0,说明没有满足条件的元素
            return []
        }
        var targetArray: [[Int]] = []
        let sortedNums = nums.sorted()

        print("sortedNums:\(sortedNums)")
        
        var i = 0
        let count = sortedNums.count
        while i < count - 1 {
            var blank = "\t"
            for _ in 0..<i {
                blank.append("\t")
            }
            /// 找到  sortedArray[i] 后边的元素中两数之和为target的元组
            let target = 0 - sortedNums[i]
            let arri = Array(sortedNums[i+1..<count])
            print("\(blank) sortedNums:\(arri) target:\(target)")
            let tempArray = twoSum(arri, target)
            print("\(blank) tempArray:\(String(describing: tempArray))")
            if tempArray!.count > 0 {
                for oneTuple in tempArray! {
                    var tuple = Array.init(oneTuple)
                    tuple.insert(sortedNums[i], at: 0)
                    targetArray.append(tuple)
                }
                print("\(blank) target:\(targetArray)")
            }
            while (i < count - 1) && (sortedNums[i] == sortedNums[i + 1]) {
                i += 1
            }
            i += 1
        }
        return targetArray
    }
    
}

//MARK: 测试用例太恶心
/*
 输入：
 [1,2,-2,-1]
 预期结果：
 []
 
 输入：
 [0,0]
 预期结果：
 []
 
 输入:
 [0,0,0]
 预期结果:
 [0,0,0]
 */

func NSumQuestions() {
    print(#function)
    
//    let nums = [-1,0,1,2,-1,-4]
//    let nums = [0,0]
    let nums = [0,0,0]
//    let nums:[Int] = []
//    let nums = [1,2,-2,-1]
    let newNums = Solution15().threeSum(nums)
    print(newNums as Any)

}
