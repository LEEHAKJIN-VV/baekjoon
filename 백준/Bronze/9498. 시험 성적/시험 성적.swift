import Foundation

let score: Int = Int(readLine()!)!
let grade: String

switch score { // 등급 분류
case 90...100:
    grade = "A"
case 80...89:
    grade = "B"
case 70...79:
    grade = "C"
case 60...69:
    grade = "D"
default:
    grade = "F"
}

print(grade)