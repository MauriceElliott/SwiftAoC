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
        var searchFromIndex = 0
        var resetSearchFromIndex = false
        if result.count > 0 {
            popped.append(highestIndex)
            print("[DEBUG] highestIndex \(highestIndex) sarr.count \(sArr.count - 1)")
            if highestIndex < (sArr.count - 1) {
                searchFromIndex = highestIndex
                resetSearchFromIndex = true
            } else if resetSearchFromIndex == true {
                searchFromIndex = 0
                resetSearchFromIndex = false
            }
            print("[DEBUG] popped: \(popped) sfi: \(searchFromIndex)")
        }
        highest = 0
        highestIndex = 0
        for (i, c) in sArr.enumerated() {
            let ci = Int(String(c))!
            if popped.contains(i) || i < searchFromIndex {
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
        let input = getContents("input/day3/input.txt")!
        let l = input.split(separator: "\n")
        var total = 0
        for (i,r) in l.enumerated() {
            if i == 2 {
                break
            }
            total += Int(evaluate(String(r), 12))!
        }
        print(total)
    }
}

