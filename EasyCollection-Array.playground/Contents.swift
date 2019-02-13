import UIKit

class Solution {
    /*
     从排序数组中删除重复项
     给定一个排序数组，你需要在原地删除重复出现的元素，使得每个元素只出现一次，返回移除后数组的新长度。
     不要使用额外的数组空间，你必须在原地修改输入数组并在使用 O(1) 额外空间的条件下完成。
     示例 1:
     给定数组 nums = [1,1,2],
     函数应该返回新的长度 2, 并且原数组 nums 的前两个元素被修改为 1, 2。
     你不需要考虑数组中超出新长度后面的元素。
     示例 2:
     给定 nums = [0,0,1,1,1,2,2,3,3,4],
     函数应该返回新的长度 5, 并且原数组 nums 的前五个元素被修改为 0, 1, 2, 3, 4。
     你不需要考虑数组中超出新长度后面的元素。
     */
    func removeDuplicates(_ nums: inout [Int]) -> Int {
        guard nums.count != 0 else { return 0 }
        var index = 0
        for (i, num) in nums.enumerated() {
            if i == 0 { continue }
            if nums[index] != num {
                index += 1
                nums[index] = num
            }
        }
        return index + 1
    }


    /*
     买卖股票的最佳时机 II
     给定一个数组，它的第 i 个元素是一支给定股票第 i 天的价格。
     设计一个算法来计算你所能获取的最大利润。你可以尽可能地完成更多的交易（多次买卖一支股票）。
     注意：你不能同时参与多笔交易（你必须在再次购买前出售掉之前的股票）。
     示例 1:
     输入: [7,1,5,3,6,4]
     输出: 7
     解释: 在第 2 天（股票价格 = 1）的时候买入，在第 3 天（股票价格 = 5）的时候卖出, 这笔交易所能获得利润 = 5-1 = 4 。
     随后，在第 4 天（股票价格 = 3）的时候买入，在第 5 天（股票价格 = 6）的时候卖出, 这笔交易所能获得利润 = 6-3 = 3 。
     示例 2:
     输入: [1,2,3,4,5]
     输出: 4
     解释: 在第 1 天（股票价格 = 1）的时候买入，在第 5 天 （股票价格 = 5）的时候卖出, 这笔交易所能获得利润 = 5-1 = 4 。
     注意你不能在第 1 天和第 2 天接连购买股票，之后再将它们卖出。
     因为这样属于同时参与了多笔交易，你必须在再次购买前出售掉之前的股票。
     示例 3:
     输入: [7,6,4,3,1]
     输出: 0
     解释: 在这种情况下, 没有交易完成, 所以最大利润为 0。
     */
    func maxProfit(_ prices: [Int]) -> Int {
        if prices.count < 2 { return 0 }
        var totalMoney = 0
        for i in 1..<prices.count {
            if prices[i] > prices[i - 1] {
                totalMoney += prices[i] - prices[i - 1]
            }
        }
        return totalMoney
    }

    /*
     旋转数组
     给定一个数组，将数组中的元素向右移动 k 个位置，其中 k 是非负数。
     示例 1:
     输入: [1,2,3,4,5,6,7] 和 k = 3
     输出: [5,6,7,1,2,3,4]
     解释:
     向右旋转 1 步: [7,1,2,3,4,5,6]
     向右旋转 2 步: [6,7,1,2,3,4,5]
     向右旋转 3 步: [5,6,7,1,2,3,4]
     示例 2:
     输入: [-1,-100,3,99] 和 k = 2
     输出: [3,99,-1,-100]
     解释:
     向右旋转 1 步: [99,-1,-100,3]
     向右旋转 2 步: [3,99,-1,-100]
     说明:
     尽可能想出更多的解决方案，至少有三种不同的方法可以解决这个问题。
     要求使用空间复杂度为 O(1) 的原地算法。
     */
    func rotate_1(_ nums: inout [Int], _ k: Int) {
        let count = nums.count
        let k = k % count
        for _ in 0..<k {
            let temp = nums[count - 1]
            for j in (1...count-1).reversed() {
                nums[j] = nums[j - 1]
            }
            nums[0] = temp
        }
    }
    // 三次翻转实现，有点厉害
    func rotate_2(_ nums: inout [Int], _ k: Int) {
        func reverse(_ nums: inout [Int], start: Int, end: Int) {
            var start = start
            var end = end
            while start < end {
                let temp = nums[start]
                nums[start] = nums[end]
                start += 1
                nums[end] = temp
                end -= 1
            }
        }
        let count = nums.count
        let k = k % count
        reverse(&nums, start: 0, end: count - 1)
        reverse(&nums, start: 0, end: k - 1)
        reverse(&nums, start: k, end: count - 1)
    }

    /*
     存在重复
     给定一个整数数组，判断是否存在重复元素。
     如果任何值在数组中出现至少两次，函数返回 true。如果数组中每个元素都不相同，则返回 false。
     示例 1:
     输入: [1,2,3,1]
     输出: true
     示例 2:
     输入: [1,2,3,4]
     输出: false
     示例 3:
     输入: [1,1,1,3,3,4,3,2,4,2]
     输出: true
     */
    func containsDuplicate(_ nums: [Int]) -> Bool {
        var set = Set<Int>()
        for num in nums {
            if set.contains(num) {
                return true
            } else {
                set.insert(num)
            }
        }
        return false
    }

    /*
     只出现一次的数字
     给定一个非空整数数组，除了某个元素只出现一次以外，其余每个元素均出现两次。找出那个只出现了一次的元素。
     说明：
     你的算法应该具有线性时间复杂度。 你可以不使用额外空间来实现吗？
     示例 1:
     输入: [2,2,1]
     输出: 1
     示例 2:
     输入: [4,1,2,1,2]
     输出: 4
    */
    // 注意异或的用法
    func singleNumber(_ nums: [Int]) -> Int {
        var a = 0
        for num in nums {
            a = a ^ num
        }
        return a
    }

    /*
     两个数组的交集 II
     给定两个数组，编写一个函数来计算它们的交集。
     示例 1:
     输入: nums1 = [1,2,2,1], nums2 = [2,2]
     输出: [2,2]
     示例 2:
     输入: nums1 = [4,9,5], nums2 = [9,4,9,8,4]
     输出: [4,9]
     说明：
     输出结果中每个元素出现的次数，应与元素在两个数组中出现的次数一致。
     我们可以不考虑输出结果的顺序。
     进阶:
     如果给定的数组已经排好序呢？你将如何优化你的算法？
     如果 nums1 的大小比 nums2 小很多，哪种方法更优？
     如果 nums2 的元素存储在磁盘上，磁盘内存是有限的，并且你不能一次加载所有的元素到内存中，你该怎么办？
    */
    func intersect(_ nums1: [Int], _ nums2: [Int]) -> [Int] {
        var map: [Int: Int] = [:]
        for num in nums1 {
            if let count = map[num] {
                map[num] = count + 1
            } else {
                map[num] = 1
            }
        }

        var result: [Int] = []
        for num in nums2 {
            if let count = map[num], count >= 1 {
                result.append(num)
                map[num] = count - 1
            }
        }
        return result
    }
}
