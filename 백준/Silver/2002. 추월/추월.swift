import Foundation

let n: Int = Int(readLine()!)! // 터널을 지나간 차의 수
var dList: [String:Int] = [:] // 대근이의 리스트 [차량번호: 들어간 순서]
var yList: [String:Int] = [:] // 영식이의 리스트 [차량번호: 나간 순서]
var passCount: Int = 0 // 추월한 차의 수
var outList: Set = Set(Array(0..<n)) // 터널에서 나가야할 차의 번호

for i in 0..<n {
    let carNumber: String = readLine()!
    dList[carNumber] = i
}

for i in 0..<n {
    let carNumber: String = readLine()!
    yList[carNumber] = i
}
let outCarList = yList.sorted(by: {c1,c2 in return c1.value < c2.value})

for (number, outTime) in outCarList {
    let inTime: Int = dList[number]! // inTime: number 차가 터널에 들어간 시간
    if inTime == 0 { // 처음에 들어온 애 -> 추월할 수가 없다 자기가 처음이므로
        outList.remove(0)
        continue
    }
    passCount += checkCar(inTime) ? 0 : 1 // 함수의 반환값 false: 추월
    outList.remove(inTime)
}

print(passCount)

// 현재 나간 차를 확인함 false: 추월, true: 추월x
func checkCar(_ outCarNum: Int) -> Bool {
    for i in 0..<outCarNum { // 현재차가 터널에서 나가는데 리스트에 이전에 들어간차가 아직 있는 경우 false
        if outList.contains(i) {
            return false
        }
    }
    return true
}

