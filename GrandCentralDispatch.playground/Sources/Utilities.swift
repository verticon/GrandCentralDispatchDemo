import UIKit

public struct Timer {
    let name: String
    let indent: Bool
    let startTime = Date()
    
    public init(name: String, indent: Bool) {
        self.name = name
        self.indent = indent
        print("\(indent ? "\t": "\n")Starting \(name) ...")
    }
    
    public func done() {
        print("\(indent ? "\t": "")\(name) completed in \(Date().timeIntervalSince(startTime)) seconds.")
    }
}

private var index = -1
private let colors: [UIColor] = [.red, .brown, .black, .yellow, .blue, .cyan, .green, .gray, .magenta, .orange, .purple]
public func getNextColor() -> UIColor {
    index = (index + 1) % colors.count
    return colors[index]
}

var printer: BaseDemo?
public func print(_ text: String) {
    var output = text
    output.append("\n")
    fputs(output, stdout)
    if let printer = printer {
        printer.print(output)
    }
}
