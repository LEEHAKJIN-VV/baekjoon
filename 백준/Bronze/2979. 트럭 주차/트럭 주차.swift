import Foundation

var input: [Int] = readLine()!.split(separator: " ").map{Int(String($0))!}
let chargeList: [Int] = [0] + input // 주차 요금 정보

var startTime: Int = 101 // 제일 빠른 주차시간
var endTime: Int = -1 // 제일 제일 늦은 주차시간
var totalCharge: Int = 0 // 총 주차 요금

var truckArray: [[Int]] = Array(repeating: [], count: 3) // [1번 트럭, 2번 트럭, 3번트럭]

for i in 0..<3 {
    input = readLine()!.split(separator: " ").map{Int(String($0))!}
    let start: Int = input[0], end: Int = input[1]
    
    endTime = max(end, endTime)
    startTime = min(start, startTime)
    truckArray[i] = Array(start..<end)
}

// 시간 계산
for i in startTime...endTime {
    var count: Int = 0
    for j in 0..<3 {
        if truckArray[j].contains(i) {
            count += 1
        }
    }
    totalCharge += chargeList[count] * count
}
print(totalCharge)
