//
//  LeetcodeArrayQuestions.swift
//  AlgorithmSwift
//
//  Created by YY on 2022/4/23.
//

import Foundation

//MARK: - 面试题 16.16. 部分排序 https://leetcode-cn.com/problems/sub-sort-lcci/
class Solution16_16 {
    func subSort0(_ array: [Int]) -> [Int] {
        var maxValue = array.first
        var rightIndex = -1
        var i = 1
        while i < array.count {
            if array[i] > maxValue! {
                maxValue = array[i]
            }
            if array[i] < maxValue! {
                rightIndex = i
            }
            i += 1
        }
        
        var leftIndex = -1
        var minValue = array.last
        var j = array.count - 2
        while j >= 0 {
            if array[j] < minValue! {
                minValue = array[j]
            }
            if array[j] > minValue! {
                leftIndex = j
            }
            j -= 1
        }
        
        return [leftIndex,rightIndex]
    }
    func subSort(_ array: [Int]) -> [Int] {

        var maxValue = array.first
        var minValue = array.last
        var leftIndex = -1
        var rightIndex = -1

        for i in 0..<array.count {
            if array[i] > maxValue! {
                maxValue = array[i]
            }
            if array[i] < maxValue! {
                rightIndex = i
            }
            
            let j = array.count - 1 - i
            if array[j] < minValue! {
                minValue = array[j]
            }
            if array[j] > minValue! {
                leftIndex = j
            }
        }
        
        return [leftIndex,rightIndex]
    }
}

//MARK: - 27.移除元素 https://leetcode-cn.com/problems/remove-element/
class Solution27 {
    func removeElement(_ nums: inout [Int], _ val: Int) -> Int {

        var left = 0
        var right = nums.count - 1
        
        var string = ""
        
        while left <= right {
            if nums[left] == val {
                let temp = nums[left]
                nums[left] = nums[right]
                nums[right] = temp
                right -= 1

            }else {
                left += 1
                string.append("\t")
                print("\(string)\(nums)")
            }
        }
        
        return left
    }
}


// MARK: - 75. 颜色分类  https://leetcode-cn.com/problems/sort-colors/
class Solution75 {
//nums = [2,0,2,1,1,0]
// 0:红色  1：白色   2：蓝色
    func sortColors(_ nums: inout [Int]) {
        var cur = 0
        var red = 0
        var blue = nums.count - 1
        var string = ""

        while cur <= blue {
            if nums[cur] == 0 {
                let temp = nums[cur]
                nums[cur] = nums[red]
                nums[red] = temp
                cur += 1
                red += 1
            }else if nums[cur] == 1 {
                cur += 1
            }else {
                let temp = nums[cur]
                nums[cur] = nums[blue]
                nums[blue] = temp
                blue -= 1
            }
            string.append("\t")
            print("\(string)\(nums)")
        }
    }
    
}


//    MARK: - 88. 合并两个有序数组 https://leetcode-cn.com/problems/merge-sorted-array/
class Solution88 {
    func merge(_ nums1: inout [Int], _ m: Int, _ nums2: [Int], _ n: Int) {

        var indexM = m - 1
        var indexN = n - 1
        var cur = m + n - 1
            
        while indexN >= 0 {
            if indexM >= 0 && nums2[indexN] < nums1[indexM] {
                nums1[cur] = nums1[indexM]
                cur -= 1
                indexM -= 1
            }else {
                nums1[cur] = nums2[indexN]
                cur -= 1
                indexN -= 1
            }
        }
    }
}

// MARK: - 03. 区域和检索 - 数组不可变 https://leetcode-cn.com/problems/range-sum-query-immutable/
class NumArray_03 {

    var preSums: [Int] = []
    
    init(_ nums: [Int]) {
        print("nums:\(nums)")
        preSums.append(0)
        for i in 1...nums.count {
            preSums.append(preSums[i - 1] + nums[i - 1])
        }
        print("preSums:\(preSums)")
    }
    
    func sumRange(_ left: Int, _ right: Int) -> Int {
        return preSums[right + 1] - preSums[left]
    }
}

func ArrayQuestions() {
    
    //MARK: - 16.16 部分排序
//    let nums = [1,2,4,7,10,11,7,12,6,7,16,18,19]
//    let nums = [1,2]
//    print (Solution16_16().subSort(nums))
    
    //MARK: - 27.移除元素
//    var nums = [3,2,2,3]
//    var nums = [0,1,2,2,3,0,4,2]
//    let count = Solution27().removeElement(&nums, 2)
//    print(count)

    // MARK: - 75. 颜色分类
//    var nums = [2,0,2,1,1,0]
//    var nums = [2,0,1]
//    print(nums)
//    Solution75().sortColors(&nums)
//    print(nums)
    
    // MARK: - 88. 合并两个有序数组
//    var nums1 = [1,2,3,0,0,0]
//    let m = 3
//    var nums2 = [2,5,6]
//    let n = 3
//
//    Solution88().merge( &nums1, m, nums2, n)
    
    // MARK: - 03
    let obj = NumArray_03([-2, 0, 3, -5, 2, -1])
    let ret_1: Int = obj.sumRange(0,5)
    print(ret_1)
    
    
}
