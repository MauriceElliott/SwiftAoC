import Foundation

private func findPattern(_ patternLength: Int, _ str: String) -> Bool {
    print("[findPattern] pl: \(patternLength), str: \(str)")
    var chunks: [String] = []
    for i in stride(from: 0, to: str.count, by: patternLength) {
        let startIndex = str.index(str.startIndex, offsetBy: i)
        let endIndex = str.index(startIndex, offsetBy: min(patternLength, str.count - i))
        chunks.append(String(str[startIndex..<endIndex]))
    }
    var prevStr: String? = nil
    var patternAquired = false
    for chunk in chunks {
        if prevStr == nil {
            prevStr = chunk
        } else if chunk == prevStr {
            prevStr = chunk
            patternAquired = true
        } else if chunk != prevStr {
            patternAquired = false
            break
        }
    }
    return patternAquired
}

struct Day02 {
    static func main() {
        let c = getContents("input/day2/input.txt")!
        let l = c.replacingOccurrences(of: "\n", with: "").split(separator: ",")
        var total = 0
        for r in l {
            let range = r.split(separator: "-")
            let start = Int(range.first!)!
            let end = Int(range.last!)!
            for i in start...end {
                let o = String(i)
                let sc = o.count
                print("i: \(i), sc: \(sc), o: \(o)")
                for pl in 0...(sc / 2) {
                    if pl == 0 { continue }              
                    if findPattern(pl, o) {
                        total += i
                        break
                    }
                }
            }
            print(total)
        }
    }
}

