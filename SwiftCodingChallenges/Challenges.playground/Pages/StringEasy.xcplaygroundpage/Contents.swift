/*
 “Challenge 1: Are the letters unique?
         Difficulty: Easy
 Write a function that accepts a String as its only parameter, and returns true if the string has only unique letters, taking letter case into account.
 Sample input and output

 The string “No duplicates” should return true.
 The string “abcdefghijklmnopqrstuvwxyz” should return true.
 The string “AaBbCc” should return true because the challenge is case-sensitive.
 The string “Hello, world” should return false because of the double Ls and double Os.
*/

func challenge1(input s: String) -> Bool {
    var letters = [Character : Int]()
    for c in s {
        if !c.isLetter {
            continue
        }
        if letters[c, default: 0] == 0 {
            letters[c] = 1
            continue
        }
        if letters[c] == 1 {
            return false
        }
    }
    return true;
}

assert(challenge1(input: "No duplicates") == true, "Challenge 1 failed")
assert(challenge1(input: "abcdefghijklmnopqrstuvwxyz") == true, "Challenge 1 failed")
assert(challenge1(input: "AaBbCc") == true, "Challenge 1 failed")
assert(challenge1(input: "Hello, world") == false, "Challenge 1 failed")

// seems true, tests evaluate fine



/*
 “Challenge 2: Is a string a palindrome?
         Difficulty: Easy
 Write a function that accepts a String as its only parameter, and returns true if the string reads the same when reversed, ignoring case.
 Sample input and output

 The string “rotator” should return true.
 The string “Rats live on no evil star” should return true.
 The string “Never odd or even” should return false; even though the letters are the same in reverse the spaces are in different places.
 The string “Hello, world” should return false because it reads “dlrow ,olleH” backwards.
*/

func isPalindrome(_ str: String) -> Bool { // challenge2
    let s = String(str.lowercased())
    let rs = String(s.reversed())
    return s == rs
}

isPalindrome("rotator")
isPalindrome("Rats live on no evil star")
isPalindrome("Never odd or even")
isPalindrome("Hello, world")

assert(isPalindrome("rotator") == true, "isPalindrome failed")
assert(isPalindrome("Rats live on no evil star") == true, "isPalindrome failed")
assert(isPalindrome("Never odd or even") == false, "isPalindrome failed")
assert(isPalindrome("Hello, world") == false, "isPalindrome failed")



/*
 “Challenge 3: Do two strings contain the same characters?
         Difficulty: Easy
 Write a function that accepts two String parameters, and returns true if they contain the same characters in any order taking into account letter case.
 Sample input and output

 The strings “abca” and “abca” should return true.
 The strings “abc” and “cba” should return true.
 The strings “ a1 b2 ” and “ b1 a2 ” should return true.
 The strings “abc” and “abca” should return false.
 The strings “abc” and “Abc” should return false.
 The strings “abc” and “cbAa” should return false.
 The strings “abcc” and “abca” should return false.
*/

func challenge3(s1: String, s2: String) -> Bool {
    if(s1.count != s2.count) {
        return false
    }
    
    var d1 = Dictionary<Character, Int>()
    var d2 = Dictionary<Character, Int>()
    
    for c in s1 {
        d1[c, default: 0] += 1;
    }
    
    for c in s2 {
        d2[c, default: 0] += 1;
    }
    
    for c in s1 {
        if(d1[c] != d2[c, default: 0]) {
            return false
        }
    }
    
    return true
}

assert(challenge3(s1: "abca", s2: "abca") == true, "Challenge 3 failed")
assert(challenge3(s1: "abc", s2: "cba") == true, "Challenge 3 failed")
assert(challenge3(s1: " a1 b2 ", s2: " b1 a2 ") == true, "Challenge 3 failed")
assert(challenge3(s1: "abc", s2: "abca") == false, "Challenge 3 failed")
assert(challenge3(s1: "abc", s2: "Abc") == false, "Challenge 3 failed")
assert(challenge3(s1: "abc", s2: "cbAa") == false, "Challenge 3 failed")
assert(challenge3(s1: "abcc", s2: "abca") == false, "Challenge 3 failed")



/*
 “Challenge 4: Does one string contain another?
         Difficulty: Easy
 Write your own version of the contains() method on String that ignores letter case, and without using the existing contains() method.
 Sample input and output

 The code "Hello, world".fuzzyContains("Hello") should return true.
 The code "Hello, world".fuzzyContains("WORLD") should return true.
 The code "Hello, world".fuzzyContains("Goodbye") should return false.
*/

extension String {
    
    func fuzzyContains(_ s: String) -> Bool {
        let sl = s.lowercased()
        let selfl = self.lowercased()
        
        var cnt = 0
        
        outerLoop: for c in selfl {
            var innerCnt = 0;
            
            innerLoop: for cs in sl {
                if cnt == sl.count {
                    return true
                }

                while(innerCnt < cnt) {
                    innerCnt += 1
                    continue innerLoop
                }

                if c == cs {
                    cnt += 1
                    // print(c, cs, innerCnt, cnt)
                    continue outerLoop
                } else {
                    cnt = 0
                    // print(c, cs, innerCnt, cnt)
                    continue outerLoop
                }
                
            }
            
        }
        
        return cnt == sl.count
    }
    
}

"Hello world".fuzzyContains("hello")

assert("Hello, world".fuzzyContains("Hello") == true, "Challenge 4 failed")
assert("Hello, world".fuzzyContains("WORLD") == true, "Challenge 4 failed")
assert("Hello, world".fuzzyContains("Goodbye") == false, "Challenge 4 failed")



/*
 “Challenge 5: Count the characters
         Difficulty: Easy
 Write a function that accepts a string, and returns how many times a specific character appears, taking case into account.
 Tip: If you can solve this without using a for-in loop, you can consider it a Tricky challenge.
 Sample input and output

 The letter “a” appears twice in “The rain in Spain”.
 The letter “i” appears four times in “Mississippi”.
 The letter “i” appears three times in “Hacking with Swift”.
*/

extension String {
    func countTheChar(_ c: Character) -> Int { // Easy
        var cnt = 0;
        
        for ch in self {
            if ch == c {
                cnt += 1
            }
        }
        
        return cnt
    }
    
    func countTheCharAlt(_ c: Character) -> Int { // Tricky
        var innerS = self
        
        if(innerS.count == 1) {
            
            if(innerS.first == c) {
                return 1
            }
            
            return 0
        }
        
        if(innerS.first == c) {
            
            innerS.remove(at: innerS.startIndex)
            return 1 + innerS.countTheCharAlt(c)
            
        }
        
        innerS.remove(at: innerS.startIndex)
        return innerS.countTheCharAlt(c)
        
    }
}

assert("The rain in Spain".countTheChar("a") == 2, "Challenge 5 failed")
assert("Mississippi".countTheChar("i") == 4, "Challenge 5 failed")
assert("Hacking with Swift".countTheChar("i") == 3, "Challenge 5 failed")

assert("The rain in Spain".countTheCharAlt("a") == 2, "Challenge 5 failed")
assert("Mississippi".countTheCharAlt("i") == 4, "Challenge 5 failed")
assert("Hacking with Swift".countTheCharAlt("i") == 3, "Challenge 5 failed")



/*
 “Challenge 6: Remove duplicate letters from a string
         Difficulty: Easy
 Write a function that accepts a string as its input, and returns the same string just with duplicate letters removed.
 Tip: If you can solve this challenge without a for-in loop, you can consider it “tricky” rather than “easy”.
 Sample input and output

 The string “wombat” should print “wombat”.
 The string “hello” should print “helo”.
 The string “Mississippi” should print “Misp”.
*/

func printWithoutDuplicates(_ s: String) {
    var chars = Set<Character>()
    var str = s
    
    var idx = 0;
    for c in s {
        if chars.contains(c) {
            str.remove(at: str.index(str.startIndex, offsetBy: idx))
            continue
        }
        chars.insert(c)
        idx += 1
    }
    
    print(str)
}

printWithoutDuplicates("wombat")
printWithoutDuplicates("hello")
printWithoutDuplicates("Mississippi")



/*
 “Challenge 7: Condense whitespace
         Difficulty: Easy
 Write a function that returns a string with any consecutive spaces replaced with a single space.
 Sample input and output
 I’ve marked spaces using “[space]” below for visual purposes:

 The string “a[space][space][space]b[space][space][space]c” should return “a[space]b[space]c”.
 The string “[space][space][space][space]a” should return “[space]a”.
 The string “abc” should return “abc”.
*/

extension String {
    func condenseWhitespace() -> String {
        var s = self
        
        if s.isEmpty {
            return s
        }
        
        var c = s.first!
        
        s.removeFirst()
        
        if s.isEmpty {
            return String(repeating: c, count: 1)
        }
        
        if c == " " && s.first == " " {
            return s.condenseWhitespace()
        }
        
        return String(repeating: c, count: 1) + s.condenseWhitespace()
    }
}

assert("a   b   c".condenseWhitespace() == "a b c", "Challenge 7 failed")
assert("    a".condenseWhitespace() == " a", "Challenge 7 failed")
assert("abc".condenseWhitespace() == "abc", "Challenge 7 failed")

