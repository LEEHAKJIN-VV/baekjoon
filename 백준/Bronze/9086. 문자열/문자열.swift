import Foundation

let n: Int = Int(readLine()!)! // 입력 개수

/// String.prefix(1) -> 첫문자 가져오기
/// String.suffix(1) -> 마지막 문자 가져오기
for _ in 1...n {
    let word: String = readLine()!
    let firstLastString: String = String(word.prefix(1)) + String(word.suffix(1))
    print(firstLastString)
}