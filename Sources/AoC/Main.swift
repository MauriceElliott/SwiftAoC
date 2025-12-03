import Foundation

func getContents(_ url: String) -> Optional<String> {
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
struct Main {
    static func main() {
        guard CommandLine.arguments.count > 1 else {
            print("Please provide a day number.")
            return
        }
        
        let day = CommandLine.arguments[1]
        
        switch day {
        case "1":
            Day01.main()
        case "2":
            Day02.main()
        default:
            print("Day \(day) not implemented yet.")
        }
    }
}
