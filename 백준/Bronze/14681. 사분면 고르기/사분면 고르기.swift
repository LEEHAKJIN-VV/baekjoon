import Foundation

// x, y 좌표
let x: Int = Int(readLine()!)!
let y: Int = Int(readLine()!)!

let point: (Int, Int) = (x, y)

switch point {
case (x, y) where x > 0 && y > 0:
    print(1)
case (x, y) where x < 0 && y > 0:
    print(2)
case (x, y) where x < 0 && y < 0:
    print(3)
case (x, y) where x > 0 && y < 0:
    print(4)
default:
    print("invaild input")
}
