import Foundation

let n: Int = Int(readLine()!)! // 입력 개수
var numberSum: Int = 0 // 산술평균 합
var numberArray = [Int]() // 입력된 정수값을 저장할 배열
var modeDict = [Int:Int]() // 최빈값 딕셔너리

for _ in 1...n {
    let inputValue: Int = Int(readLine()!)!
    numberSum += inputValue // 산술평균을 위한 정수를 합함
    
    // 최빈값을 위해 딕셔너리 값 설정
    let count: Int = modeDict[inputValue, default: 0] + 1
    modeDict.updateValue(count, forKey: inputValue)
    
    numberArray.append(inputValue) // 정수 합침
}

// n은 입력의 개수 = 배열의 길이
// 1. 산술평균
let avg: Double = Double(numberSum) / Double(n) // 반올림 하기전
print(Int(round(avg * 10 / 10))) // 첫째자리에서 반올림
// 2. 중앙값
print(numberArray.sorted()[n/2])
// 3. 최빈값
if n < 2 { // 입력 정수의 개수가 1개인경우
    print(numberArray[0])
} else {
    let orderDict = modeDict.sorted(by: {
        if $0.value == $1.value { // 카운트가 같은 경우 카운트에 해당하는 값으로 정렬
            return $0.key < $1.key
        }
        return $0.value > $1.value // 카운트가 다른 경우 카운트로 정렬
    })
    if orderDict[0].value == orderDict[1].value { // 최빈값이 2개이상인 경우
        print(orderDict[1].key) // 최빈값 중 2번째로 작은값 출력
    } else {
        print(orderDict[0].key) // 최빈값 출력
    }
}
// 4. 범위
print(numberArray.max()! - numberArray.min()!)