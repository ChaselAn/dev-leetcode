import UIKit

class Solution {
    /*
     编写一个函数，其作用是将输入的字符串反转过来。输入字符串以字符数组 char[] 的形式给出。
     不要给另外的数组分配额外的空间，你必须原地修改输入数组、使用 O(1) 的额外空间解决这一问题。
     你可以假设数组中的所有字符都是 ASCII 码表中的可打印字符。
     示例 1：
     输入：["h","e","l","l","o"]
     输出：["o","l","l","e","h"]
     示例 2：
     输入：["H","a","n","n","a","h"]
     输出：["h","a","n","n","a","H"]
    */
    func reverseString(_ s: inout [Character]) {
        for i in 0..<s.count / 2 {
            (s[i], s[s.count - 1 - i]) = (s[s.count - 1 - i], s[i])
        }
    }

    /*
     给出一个 32 位的有符号整数，你需要将这个整数中每位上的数字进行反转。
     示例 1:
     输入: 123
     输出: 321
     示例 2:
     输入: -123
     输出: -321
     示例 3:
     输入: 120
     输出: 21
     注意:
     假设我们的环境只能存储得下 32 位的有符号整数，则其数值范围为 [−2^31,  2^31 − 1]。请根据这个假设，如果反转后整数溢出那么就返回 0。
    */
    func reverse(_ x: Int) -> Int {
        let str = "\(x)"
        var s: [Character] = []
        var isMinus = false
        for c in str {
            if c == "-" {
                isMinus = true
                continue
            }
            s.append(c)
        }
        for i in 0..<s.count / 2 {
            (s[i], s[s.count - 1 - i]) = (s[s.count - 1 - i], s[i])
        }
        let finalStr = String(s)
        let resInt = Int32(finalStr) ?? 0
        return Int(isMinus ? -resInt : resInt)
    }

    /*
     给定一个字符串，找到它的第一个不重复的字符，并返回它的索引。如果不存在，则返回 -1。
     案例:
     s = "leetcode"
     返回 0.
     s = "loveleetcode",
     返回 2.
     注意事项：您可以假定该字符串只包含小写字母。
    */
    func firstUniqChar(_ s: String) -> Int {
        var map: [Character: (Int, Int)] = [:]
        for (i, c) in s.enumerated() {
            if let info = map[c] {
                map[c] = (i, info.1 + 1)
            } else {
                map[c] = (i, 1)
            }
        }
        var index: Int?
        for info in map {
            let i = info.value.0
            if info.value.1 == 1 {
                index = index == nil ? i : min(i, index!)
            }
        }
        return index ?? -1
    }

    /*
     给定两个字符串 s 和 t ，编写一个函数来判断 t 是否是 s 的一个字母异位词。
     示例 1:
     输入: s = "anagram", t = "nagaram"
     输出: true
     示例 2:
     输入: s = "rat", t = "car"
     输出: false
     说明:
     你可以假设字符串只包含小写字母。
     进阶:
     如果输入字符串包含 unicode 字符怎么办？你能否调整你的解法来应对这种情况？
    */
    func isAnagram(_ s: String, _ t: String) -> Bool {
        func createMap(str: String) -> [Character: Int] {
            var map: [Character: Int] = [:]
            for c in str {
                if let count = map[c] {
                    map[c] = count + 1
                } else {
                    map[c] = 1
                }
            }
            return map
        }
        if s.count != t.count { return false }
        return createMap(str: s) == createMap(str: t)
    }
}
