import UIKit

class Solution {
    /*
     反转字符串
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
     整数反转
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
     字符串中的第一个唯一字符
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
     有效的字母异位词
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

    /*
     验证回文字符串
     给定一个字符串，验证它是否是回文串，只考虑字母和数字字符，可以忽略字母的大小写。
     说明：本题中，我们将空字符串定义为有效的回文串。
     示例 1:
     输入: "A man, a plan, a canal: Panama"
     输出: true
     示例 2:
     输入: "race a car"
     输出: false
    */
    func isPalindrome(_ s: String) -> Bool {
        var array: [Int] = []
        for scalar in s.unicodeScalars {
            var asciiCode = Int(scalar.value)
            if asciiCode >= 97 && asciiCode <= 122 {
                asciiCode -= 32
            }
            if (asciiCode >= 48 && asciiCode <= 57) || (asciiCode >= 65 && asciiCode <= 90) {
                array.append(asciiCode)
            }
        }
        for i in 0..<(array.count / 2) {
            if array[i] == array[array.count - 1 - i] {
                continue
            } else {
                return false
            }
        }
        return true
    }

    /*
     字符串转换整数 (atoi)
     请你来实现一个 atoi 函数，使其能将字符串转换成整数。
     首先，该函数会根据需要丢弃无用的开头空格字符，直到寻找到第一个非空格的字符为止。
     当我们寻找到的第一个非空字符为正或者负号时，则将该符号与之后面尽可能多的连续数字组合起来，作为该整数的正负号；假如第一个非空字符是数字，则直接将其与之后连续的数字字符组合起来，形成整数。
     该字符串除了有效的整数部分之后也可能会存在多余的字符，这些字符可以被忽略，它们对于函数不应该造成影响。
     注意：假如该字符串中的第一个非空格字符不是一个有效整数字符、字符串为空或字符串仅包含空白字符时，则你的函数不需要进行转换。
     在任何情况下，若函数不能进行有效的转换时，请返回 0。
     说明：
     假设我们的环境只能存储 32 位大小的有符号整数，那么其数值范围为 [−2^31,  2^31 − 1]。如果数值超过这个范围，qing返回  INT_MAX (2^31 − 1) 或 INT_MIN (−2^31) 。
     示例 1:
     输入: "42"
     输出: 42
     示例 2:
     输入: "   -42"
     输出: -42
     解释: 第一个非空白字符为 '-', 它是一个负号。
     我们尽可能将负号与后面所有连续出现的数字组合起来，最后得到 -42 。
     示例 3:
     输入: "4193 with words"
     输出: 4193
     解释: 转换截止于数字 '3' ，因为它的下一个字符不为数字。
     示例 4:
     输入: "words and 987"
     输出: 0
     解释: 第一个非空字符是 'w', 但它不是数字或正、负号。
     因此无法执行有效的转换。
     示例 5:
     输入: "-91283472332"
     输出: -2147483648
     解释: 数字 "-91283472332" 超过 32 位有符号整数范围。
     因此返回 INT_MIN (−2^31) 。
    */
    func myAtoi(_ str: String) -> Int {
        var isNegative = false
        var isSpace = true
        var resStr = ""
        for c in str {
            if isSpace, c == " " {
                continue
            } else if !isSpace, c == " " {
                break
            }
            if isSpace, c == "+" {
                isSpace = false
                isNegative = false
                continue
            }
            if isSpace, c == "-" {
                isSpace = false
                isNegative = true
                continue
            }
            isSpace = false
            let asciiCode = Int(c.unicodeScalars.first!.value)
            if asciiCode >= 48 && asciiCode <= 57 {
                resStr += String(c)
            } else {
                break
            }
        }
        if resStr.isEmpty {
            return 0
        } else if Int32(resStr) == nil {
            return isNegative ? Int(Int32.min) : Int(Int32.max)
        } else {
            return isNegative ? -Int(resStr)! : Int(resStr)!
        }
    }
}
