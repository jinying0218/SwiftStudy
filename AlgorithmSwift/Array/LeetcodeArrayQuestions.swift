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

// MARK: - 48. 旋转图像 https://leetcode.cn/problems/rotate-image/
class Solution_48 {
    
    func reverseMatrix(_ nums: inout [Int]) {
        var i = 0
        var j = nums.count - 1
        while j > i {
            let temp = nums[i]
            nums[i] = nums[j]
            nums[j] = temp
            i += 1
            j -= 1
        }
    }
    
    func showMatrix(_ matrix: [[Int]]) {
        print("\n")
        for i in 0..<matrix.count {
            var log = ""
            for j in matrix[i] {
                log.append("\(j)\t")
            }
            print(log)
        }
        print("\n")
    }
    
    func rotate(_ matrix: inout [[Int]]) {
        let n = matrix.count
        for i in 0..<n {
            for j in i..<n {
                let temp = matrix[i][j]
                matrix[i][j] = matrix[j][i]
                matrix[j][i] = temp
            }
        }
        showMatrix(matrix)
        for i in 0..<matrix.count {
            reverseMatrix(&matrix[i])
        }
        showMatrix(matrix)
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
// MARK: - 304. 二维区域和检索 - 矩阵不可变 https://leetcode-cn.com/problems/range-sum-query-2d-immutable/
class NumMatrix_304 {
// 定义：preSum[i][j] 记录 matrix 中子矩阵 [0, 0, i-1, j-1] 的元素和
    var preSum: [[Int]]?
    var subArray: [Int]?
    init(_ matrix: [[Int]]) {
        let m = matrix.count
        let n = matrix[0].count
        subArray = Array.init(repeating: 0, count: n + 1)
        preSum = Array.init(repeating: subArray!, count: m + 1)
        for i in 0..<m {
            for j in 0..<n {
                preSum![i+1][j+1] = preSum![i][j + 1] + preSum![i + 1][j] + matrix[i][j] - preSum![i][j]
                print("\t\(matrix[i][j])",terminator:"")
            }
            print("\n")
        }
        print("~~~")
        for i in 0..<preSum!.count {
            for j in 0..<preSum![0].count {
                print("\t\(preSum![i][j])",terminator:"")
            }
            print("\n")
        }
                
        print(matrix)
    }
    
    func sumRegion(_ row1: Int, _ col1: Int, _ row2: Int, _ col2: Int) -> Int {
        let red = preSum![row2 + 1][col2 + 1]
        let blue = preSum![row1][col2 + 1]
        let yellow = preSum![row2 + 1][col1]
        let pink = preSum![row1][col1]
        print("red:\(red) blue:\(blue) yellow:\(yellow) pink:\(pink) ")
        return red - blue - yellow + pink
//        return preSum![row2 + 1][col2 + 1] - preSum![row1][col2 + 1] - preSum![row2 + 1][col1] + preSum![row1][col1]
    }
}

// MARK: - 560. 和为 K 的子数组 https://leetcode-cn.com/problems/subarray-sum-equals-k/
class Solution_560 {
    func subarraySum0(_ nums: [Int], _ k: Int) -> Int {
            var preSum = Array.init(repeating: 0, count: nums.count + 1)
            for i in 0..<nums.count {
                preSum[i+1] = preSum[i] + nums[i]
            }
            print("preSum:\(preSum)")
            var count = 0
            for i in 0..<preSum.count {
                for j in 0..<i {
                    if preSum[i] - preSum[j] == k {
                        count += 1
                    }
                }
            }

            return count
    }
    func subarraySum(_ nums: [Int], _ k: Int) -> Int {
        var count = 0
        var preSum:[Int:Int] = [:]
        var sum = 0
        for i in 0..<nums.count {
            sum += nums[i]
            if sum == k {
                count += 1
            }
            if let minus = preSum[sum - k] {
                count += minus
            }
            preSum[sum,default: 0] += 1
        }

        return count
    }
}

// MARK: - 1109. 航班预订统计 https://leetcode.cn/problems/corporate-flight-bookings/
class Solution_1109 {
    // MARK - 差分数组
    class DiffArray {
        var diff :[Int]
        
        init(_ nums: [Int]) {
            diff = Array.init(repeating: 0, count: nums.count)
            diff[0] = nums[0]
            for i in 1..<nums.count {
                diff[i] = nums[i] - nums[i - 1]
            }
        }
        
        func increment(i: Int, j: Int, val: Int) {
            diff[i] += val
            guard j+1<diff.count else {
                return
            }
            diff[j+1] -= val
        }
        
        func resultNums() -> [Int] {
            var res: [Int] = [Int].init(repeating: 0, count: diff.count)
            res[0] = diff[0]
            for i in 1..<diff.count {
                res[i] = res[i - 1] + diff[i]
            }
            return res
        }
    }
    
    func corpFlightBookings(_ bookings: [[Int]], _ n: Int) -> [Int] {
        let nums:[Int] = [Int].init(repeating: 0, count: n)
        
        let diff = DiffArray.init(nums)

        for (_ , book) in bookings.enumerated() {
            let i = book[0] - 1
            let j = book[1] - 1
            let val = book[2]
            
            diff.increment(i: i, j: j, val: val)
        }
        
        return diff.resultNums()
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
    
    // MARK: - 03.区域和检索 - 数组不可变
//    let obj = NumArray_03([-2, 0, 3, -5, 2, -1])
//    let ret_1: Int = obj.sumRange(0,5)
//    print(ret_1)
    
    // MARK: - 304. 二维区域和检索 - 矩阵不可变
//    let obj = NumMatrix_304([[3,0,1,4,2],[5,6,3,2,1],[1,2,0,1,5],[4,1,0,1,7],[1,0,3,0,5]])
//    let ret_1: Int = obj.sumRegion(2,1,4,3)
//    let ret_2: Int = obj.sumRegion(1, 1, 2, 2)
//    let ret_3: Int = obj.sumRegion(1, 2, 2, 4)
//
//    print("\(ret_1)\n\(ret_2)\n\(ret_3)")
    
    // MARK: - 560. 和为 K 的子数组
//    let nums1 = [1,1,1]
//    let ret_1 = Solution_560().subarraySum(nums1, 2)
//    let nums2 = [0,0,0,0,0,0,0,0,0,0]
//    let ret_2 = Solution_560().subarraySum(nums2, 0)
//    print("\(ret_2)")
    
    // MARK: - 1109. 航班预订统计
//    let bookings = [[1,2,10],[2,3,20],[2,5,25]]
//    let n = 5
//    let res_1 = Solution_1109().corpFlightBookings(bookings, n)
//
//    print(res_1)

    // MARK: - 48. 旋转图像
    var nums = [[1,2,3],[4,5,6],[7,8,9]]
    Solution_48().rotate(&nums)
    
}
