import UIKit

public class ListNode {
    public var val: Int
    public var next: ListNode?
    public init(_ val: Int) {
        self.val = val
        self.next = nil
    }
}
class Solution {
    /*
     1. 两数之和
     给定一个整数数组 nums 和一个目标值 target，请你在该数组中找出和为目标值的那 两个 整数，并返回他们的数组下标。

     你可以假设每种输入只会对应一个答案。但是，你不能重复利用这个数组中同样的元素。
     
     示例:

     给定 nums = [2, 7, 11, 15], target = 9

     因为 nums[0] + nums[1] = 2 + 7 = 9
     所以返回 [0, 1]
     */
    func twoSum(_ nums: [Int], _ target: Int) -> [Int] {
        switch target {
        case 1:
            // 暴力解
            for i in 0..<nums.count {
                for j in (i + 1)..<nums.count {
                    if nums[i] + nums[j] == target {
                        return [i, j]
                    }
                }
            }
        case 2:
            // 两遍哈希表
            var map: [Int: Int] = [:]
            for i in 0..<nums.count {
                map[nums[i]] = i
            }
            for i in 0..<nums.count {
                let dif = target - nums[i]
                if let index = map[dif], index != i {
                    return [i, index]
                }
            }
        case 3:
            // 一遍哈希表
            var map: [Int: Int] = [:]
            for i in 0..<nums.count {
                let dif = target - nums[i]
                if let index = map[dif], index != i {
                    return [i, index]
                }
                map[nums[i]] = i
            }
        default:
            break
        }
        return []
    }

    /*
     2. 两数相加
     给出两个 非空 的链表用来表示两个非负的整数。其中，它们各自的位数是按照 逆序 的方式存储的，并且它们的每个节点只能存储 一位 数字。

     如果，我们将这两个数相加起来，则会返回一个新的链表来表示它们的和。

     您可以假设除了数字 0 之外，这两个数都不会以 0 开头。

     示例：

     输入：(2 -> 4 -> 3) + (5 -> 6 -> 4)
     输出：7 -> 0 -> 8
     原因：342 + 465 = 807
     */
    func addTwoNumbers(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
        let dummyHead = ListNode(0)
        var curr = dummyHead
        var carry = 0
        var tempL1 = l1
        var tempL2 = l2
        while tempL1 != nil || tempL2 != nil {
            let x = tempL1?.val ?? 0
            let y = tempL2?.val ?? 0
            let sum = carry + x + y
            carry = sum / 10
            curr.next = ListNode(sum % 10)
            curr = curr.next!
            if let p = tempL1 {
                tempL1 = p.next
            }
            if let q = tempL2 {
                tempL2 = q.next
            }
        }

        if carry > 0 {
            curr.next = ListNode(carry)
        }
        return dummyHead.next
    }
}
