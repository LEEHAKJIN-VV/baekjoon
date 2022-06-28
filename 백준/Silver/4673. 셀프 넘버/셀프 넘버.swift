import Foundation

let maxNumber: Int = 10000
var genSet: Set = Set<Int>() // 생성자 집합

for i in 1...maxNumber {
    genSet.insert(makeGenerator(i)) // d(i) 생성자 수 만듬
    if !genSet.contains(i) { // i가 생성자가 아니라면 셀프넘버 -> 출력
        print(i)
    }
}

// 생성자 수 d(num)을 만듬
func makeGenerator(_ num: Int) -> Int {
    if num < 10 {
        return num * 2
    }
    // 각 자릿수 구하기
    var value: Int = num
    var digitSum: Int = 0 // 각 자릿수 합
    
    while value > 0 {
        digitSum += value % 10
        value = value / 10
    }
    return num + digitSum
}

