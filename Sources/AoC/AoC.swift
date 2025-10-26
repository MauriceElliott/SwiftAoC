// The Swift Programming Language
// https://docs.swift.org/swift-book

import Foundation

private func getContents(_ url: String) -> Optional<String> {
        let url = URL(fileURLWithPath: url)

        do {
            let contents = try String(contentsOf: url, encoding: .utf8)
            return contents
        } catch {
            print("Error: \(error)")
        }
        return nil
}

@main
struct AoC {
    static func main() {
        let c = getContents("input/day1/input.txt")!
        var a = Array<Int>()
        var b = Array<Int>()
        var t = 0

        let l = c.split(separator: "\n")
        for r in l {
            let rs = r.split(separator: "   ")
            a.append(Int(rs[0])!)
            b.append(Int(rs[1])!)
        }

        for i in 0..<a.count {
            let d = a[i] - b[i]
            t += d
            print("a \(a[i])")
            print("b \(b[i])")
            print("d \(d)")
        }

        print(t)
    }
}
