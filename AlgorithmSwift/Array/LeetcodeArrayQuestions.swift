//
//  LeetcodeArrayQuestions.swift
//  AlgorithmSwift
//
//  Created by YY on 2022/4/23.
//

import Foundation

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

func ArrayQuestions() {
    
    var nums1 = [1,2,3,0,0,0]
    let m = 3
    var nums2 = [2,5,6]
    let n = 3
    
    Solution88().merge( &nums1, m, nums2, n)
    
}
