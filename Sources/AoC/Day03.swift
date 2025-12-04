import Foundation

private func evaluate(_ s: String, _ remaining: Int) -> String {
    var result: [Int: Int] = [:]
    let sArr: [String] = s.map { String($0) }
    var popped: [Int] = []

    print("[DEBUG] s value: \(s)")

    var highest = 0
    var highestIndex = 0
    for _ in 0..<remaining {
        print("[DEBUG] Entered For Loop, result: \(result), count: \(result.count)")
        if result.count > 0 {
            popped.append(highestIndex)
            print("[DEBUG] popped: \(popped)")
        }
        highest = 0
        highestIndex = 0
        for (i, c) in sArr.enumerated() {
            let ci = Int(String(c))!
            if popped.contains(i) {
                continue
            }
            if ci > highest {
                highest = ci
                highestIndex = i
                print("[DEBUG] highest if: \(ci), index: \(highestIndex)")
            }
        }
        result[highestIndex] = highest
    }
    let sorted = result.sorted { $0.key < $1.key }
    print("[DEBUG] sorted list: \(sorted)")
    var returnValue = ""
    for r in sorted {
        returnValue = "\(returnValue)\(String(r.value))"
    }
    print("[DEBUG] return value: \(returnValue)")
    return returnValue
}

struct Day03 {
    static func main() {
        let input = getContents("input/day3/sample.txt")!
        let l = input.split(separator: "\n")
        var total = 0
        for r in l {
            total += Int(evaluate(String(r), 2))!
        }
        print(total)
    }
}

