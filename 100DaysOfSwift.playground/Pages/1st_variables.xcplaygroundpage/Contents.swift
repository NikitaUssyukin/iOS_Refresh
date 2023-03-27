import UIKit

//example of a variable usage
var str = "Hello, playground"
str = "Goodbye"

var age = 38

//digits can be divided with underscores for better visual perception
var population = 8_000_000

//multi-line string
var str1 = """
multiple line
string
example
"""

//in case it's just a matter of formatting the code but not making the actual string multi-lined
var str2 = """
this goes \
over \
multiple lines
"""

//this is automatically double
var pi = 3.141
//also doubles can't be mixed with integers

var awesome = true

//string interpolation - ability to place variables iside a string
var score = 85
var str3 = "Your score was \(score)"

//interpolation can be done as many times as you need
var results = "The test results are here: \(str3)"
//string interpolation isn’t just limited to placing variables – you can actually run code inside there

//constans

let toyota = "yaris"
//toyota = "supra" - this won't run

//type annotation; in the upper examples the type was set by inference
let album: String = "Reputation"
let year: Int = 1989
let height: Double = 1.78
let toyotaRocks: Bool = true


