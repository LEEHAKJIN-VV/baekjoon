import Foundation

let times: [Int] = readLine()!.split(separator: " ").map{Int(String($0))!} // [시간, 분, 초]
var totalTitme: Int = 3600 * times[0] + 60 * times[1] + times[2] // 총 시간을 second로 계산
let n: Int = Int(readLine()!)!
let MAX_TIME: Int = 86400

for _ in 1...n {
    let inputs: [Int] = readLine()!.split(separator: " ").map{Int(String($0))!}
    let t: Int = inputs[0]
    
    if t == 1 { // 시계를 앞으로 돌림
        let c: Int = inputs[1]
        totalTitme = (totalTitme + c) % MAX_TIME
    } else if t == 2 { // 시계를 뒤로 돌림
        let c: Int = inputs[1]
        totalTitme = (totalTitme - c) % MAX_TIME
        if totalTitme < 0 {
            totalTitme += MAX_TIME
        }
    } else { // 현재시간 출력
        printCurrentTime(time: totalTitme)
    }
}

func printCurrentTime(time: Int) { // 초를 이용하여 현재 시각을 출력 하는 함수
    let hour: Int = (time / 3600) % 24
    let minute: Int = (time / 60) % 60
    let second: Int = time % 60
    print(hour, minute, second)
}
