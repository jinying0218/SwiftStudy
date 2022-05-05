//
//  QueueOperate.swift
//  AlgorithmSwift
//
//  Created by YY on 2022/5/5.
//

import Foundation

//MARK: - 239. 滑动窗口最大值  https://leetcode-cn.com/problems/sliding-window-maximum/

class Solution_239 {
    @discardableResult
    func maxSlidingWindow(_ nums: [Int], _ k: Int) -> [Int] {
        if nums.count < k {
            return []
        }
        var queue :[Int] = []
        var res :[Int] = []
        
        for (i,x) in nums.enumerated() {
//            print("i:\(i)  x:\(x)")
            if i >= k && queue.first! <= i - k {
                queue.removeFirst()
                print("queue-队头失效:\(queue)")
            }
            
            while !queue.isEmpty && nums[queue.last!] <= x {
                queue.popLast()
                print("queue-弹出队尾:\(queue)")
            }
            queue.append(i)
            print("queue添加:\(queue)")

            if i >= k - 1 {
                res.append(nums[queue.first!])
//                print("res.append:\(res)")
            }
        }
        return res
    }
    /// 超时
    func maxSlidingWindow0(_ nums: [Int], _ k: Int) -> [Int] {
        if nums.count < k {
            return []
        }
        var queue :[Int] = []
        var res :[Int] = []
        
        for (i,x) in nums.enumerated() {
            /// 队尾小于x，弹出队尾，直到queue为空，或者queue中有比x大的值
            while !queue.isEmpty && nums[queue.last!] < x {
                queue.popLast()
                print("queue-弹出队尾:\(queue)")
            }
            /// 满足条件入队
            queue.append(i)
            print("queue添加:\(queue)")

            let window = i - k + 1
            /// 判断window索引是否合法
            if window < 0 {
                continue
            }
            /// 判断queue中的第一个元素是否在窗口范围内，不在范围内的，移除
            if queue.first! < window {
                queue.removeFirst()
                print("queue-队头失效:\(queue)")
            }
            res.append(nums[queue.first!])
        }
        return res
    }
}

func QueueOperate() {
    //MARK: - 239. 滑动窗口最大值
    let nums = [1,3,-1,-3,5,3,6,7,9,5,4,2,1,-3,1,3,-1,-3,5,3,6,7,9,5,4,2,1,-3]
//    print(nums)
    let res = Solution_239().maxSlidingWindow(nums, 10)
    print(res)
    print("超时")
    let res1 = Solution_239().maxSlidingWindow0(nums, 10)
    print(res1)
}
