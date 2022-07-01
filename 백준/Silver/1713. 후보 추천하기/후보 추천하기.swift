import Foundation

let frameSize: Int = Int(readLine()!)! // 사진틀의 수
let recommSize: Int = Int(readLine()!)! // 학생의 총 추천 횟수
let recommInfo: [Int] = readLine()!.split(separator: " ").map{Int(String($0))!} // 추천 정보
var people: [[Int]] = Array(repeating: [], count: frameSize) // 최종후보 학생들 [학생번호,추천받은 횟수, 액자에 들어간 시간]
var frameCount: Int = 0 // 현재 액자에 들어있는 학생 수

for (time, number) in recommInfo.enumerated() {
    let curFrameState = checkFrame(number)
    
    if frameCount < frameSize && !curFrameState.flag { // 액자가 비어있음
        people[frameCount] = [number, 1, time] // [학생번호, 추천횟수, 시간]
        frameCount += 1
    } else if curFrameState.flag { // 액자에 있는 후보가 이미 추천된 경우
        people[curFrameState.index][1] += 1
    } else { // 액자가 가득 참 -> 추천횟수가 가장 후보를 제거함
        updateFrame(&people) // 액자에서 제거할 학생을 제일 뒤로 보냄
        people.popLast()
        people.append([number,1,time])
    }
}

people = people.filter({!$0.isEmpty})

for finalCandidate in people.sorted(by: {$0[0] < $1[0] }) {
    print(finalCandidate[0], terminator: " ")
}

// 액자 업데이트
// popLast가 제일 마지막이니깐 스택처럼 배열 끝만 제거하자
func updateFrame(_ candidate: inout [[Int]]) {
    candidate.sort(by: {
        c1, c2 in
        if c1[1] != c2[1] {
            return c1[1] > c2[1]
        } else {
            return c1[2] > c2[2]
        }
    })
}

// 추천받은 후보가 액자에 있는 경우
func checkFrame(_ number: Int) -> (flag: Bool, index: Int) {
    for (i,p) in people.enumerated() {
        if !p.isEmpty {
            if p[0] == number {
                return (true,i)
            }
        }
    }
    return (false,-1)
}
