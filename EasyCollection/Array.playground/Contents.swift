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

    /*
     加一
     给定一个由整数组成的非空数组所表示的非负整数，在该数的基础上加一。
     最高位数字存放在数组的首位， 数组中每个元素只存储一个数字。
     你可以假设除了整数 0 之外，这个整数不会以零开头。
     示例 1:
     输入: [1,2,3]
     输出: [1,2,4]
     解释: 输入数组表示数字 123。
     示例 2:
     输入: [4,3,2,1]
     输出: [4,3,2,2]
     解释: 输入数组表示数字 4321。
    */
    func plusOne(_ digits: [Int]) -> [Int] {
        var index = digits.count - 1
        var res = digits
        while index >= 0 {
            if digits[index] != 9 {
                res[index] = digits[index] + 1
                return res
            } else {
                res[index] = 0
                if index == 0, digits[index] == 9 {
                    res.insert(1, at: 0)
                    return res
                }
                index -= 1
            }
        }
        return digits
    }

    /*
     移动零
     给定一个数组 nums，编写一个函数将所有 0 移动到数组的末尾，同时保持非零元素的相对顺序。
     示例:
     输入: [0,1,0,3,12]
     输出: [1,3,12,0,0]
     说明:
     必须在原数组上操作，不能拷贝额外的数组。
     尽量减少操作次数。
    */
    func moveZeroes(_ nums: inout [Int]) {
        var lastZeroIndex: Int?
        var extraZero = 0
        for (i, num) in nums.enumerated() {
            if num == 0 {
                if lastZeroIndex == nil {
                    lastZeroIndex = i
                } else {
                    extraZero += 1
                }
            } else if let tempLastZeroIndex = lastZeroIndex {
                nums[tempLastZeroIndex] = nums[i]
                nums[i] = 0
                lastZeroIndex = i - extraZero
            }
        }
    }

    /*
     两数之和
     给定一个整数数组 nums 和一个目标值 target，请你在该数组中找出和为目标值的那 两个 整数，并返回他们的数组下标。
     你可以假设每种输入只会对应一个答案。但是，你不能重复利用这个数组中同样的元素。
     示例:
     给定 nums = [2, 7, 11, 15], target = 9
     因为 nums[0] + nums[1] = 2 + 7 = 9
     所以返回 [0, 1]
    */
    func twoSum(_ nums: [Int], _ target: Int) -> [Int] {
        for index in 0..<nums.count {
            let firstNum = nums[index]
            for restIndex in (index + 1)..<nums.count where firstNum + nums[restIndex] == target {
                return [index, restIndex]
            }
        }
        return []
    }

    /*
     有效的数独
     判断一个 9x9 的数独是否有效。只需要根据以下规则，验证已经填入的数字是否有效即可。
     1.数字 1-9 在每一行只能出现一次。
     2.数字 1-9 在每一列只能出现一次。
     3.数字 1-9 在每一个以粗实线分隔的 3x3 宫内只能出现一次。
     数独部分空格内已填入了数字，空白格用 '.' 表示。
     示例 1:
     输入:
     [
     ["5","3",".",".","7",".",".",".","."],
     ["6",".",".","1","9","5",".",".","."],
     [".","9","8",".",".",".",".","6","."],
     ["8",".",".",".","6",".",".",".","3"],
     ["4",".",".","8",".","3",".",".","1"],
     ["7",".",".",".","2",".",".",".","6"],
     [".","6",".",".",".",".","2","8","."],
     [".",".",".","4","1","9",".",".","5"],
     [".",".",".",".","8",".",".","7","9"]
     ]
     输出: true
     示例 2:
     输入:
     [
     ["8","3",".",".","7",".",".",".","."],
     ["6",".",".","1","9","5",".",".","."],
     [".","9","8",".",".",".",".","6","."],
     ["8",".",".",".","6",".",".",".","3"],
     ["4",".",".","8",".","3",".",".","1"],
     ["7",".",".",".","2",".",".",".","6"],
     [".","6",".",".",".",".","2","8","."],
     [".",".",".","4","1","9",".",".","5"],
     [".",".",".",".","8",".",".","7","9"]
     ]
     输出: false
     解释: 除了第一行的第一个数字从 5 改为 8 以外，空格内其他数字均与 示例1 相同。
     但由于位于左上角的 3x3 宫内有两个 8 存在, 因此这个数独是无效的。
     说明:
     一个有效的数独（部分已被填充）不一定是可解的。
     只需要根据以上规则，验证已经填入的数字是否有效即可。
     给定数独序列只包含数字 1-9 和字符 '.' 。
     给定数独永远是 9x9 形式的。
    */
    func isValidSudoku(_ board: [[Character]]) -> Bool {
        func isSingleNum(_ nums: [Character]) -> Bool {
            var set = Set<Character>()
            for num in nums where num != "." {
                if !set.contains(num) {
                    set.insert(num)
                } else {
                    return false
                }
            }
            return true
        }

        var columnBoard: [[Character]] = []
        var nineBoard: [[Character]] = []
        for (rowIndex, row) in board.enumerated() {
            if !isSingleNum(row) {
                return false
            }
            if rowIndex == 0 {
                for char in row {
                    columnBoard.append([char])
                }
            } else {
                for (index, char) in row.enumerated() {
                    columnBoard[index].append(char)
                }
            }
            if rowIndex % 3 == 0 {
                for (index, char) in row.enumerated() {
                    if index % 3 == 0 {
                        nineBoard.append([char])
                    } else {
                        nineBoard[(index - 1) / 3 + (rowIndex / 3) * 3].append(char)
                    }
                }
            } else {
                for (index, char) in row.enumerated() {
                    nineBoard[index / 3 + (rowIndex / 3) * 3].append(char)
                }
            }
        }
        for column in columnBoard {
            if !isSingleNum(column) {
                return false
            }
        }
        for nine in nineBoard {
            if !isSingleNum(nine) {
                return false
            }
        }
        return true
    }

    /*
     给定一个 n × n 的二维矩阵表示一个图像。
     将图像顺时针旋转 90 度。
     说明：
     你必须在原地旋转图像，这意味着你需要直接修改输入的二维矩阵。请不要使用另一个矩阵来旋转图像。
     示例 1:
     给定 matrix =
     [
     [1,2,3],
     [4,5,6],
     [7,8,9]
     ],
     原地旋转输入矩阵，使其变为:
     [
     [7,4,1],
     [8,5,2],
     [9,6,3]
     ]
     示例 2:
     给定 matrix =
     [
     [ 5, 1, 9,11],
     [ 2, 4, 8,10],
     [13, 3, 6, 7],
     [15,14,12,16]
     ],
     原地旋转输入矩阵，使其变为:
     [
     [15,13, 2, 5],
     [14, 3, 4, 1],
     [12, 6, 8, 9],
     [16, 7,10,11]
     ]
    */
    func rotate(_ matrix: inout [[Int]]) {
        let len = matrix.count
        for i in 0..<(len / 2) {
            let start = i
            let end = len - i - 1
            for j in 0..<(end - start) {
                let temp = matrix[start][start + j]
                matrix[start][start + j] = matrix[end - j][start]
                matrix[end - j][start] = matrix[end][end - j]
                matrix[end][end - j] = matrix[start + j][end]
                matrix[start + j][end] = temp
            }
        }
    }
}
