//: [UI Responsiveness](@previous)
import PlaygroundSupport
import UIKit
/*:
 The succeed function demonstrates how to properly access a UI element from a thread other than the main thread
 */
//#-editable-code
func succeed(button: UIButton) {
    DispatchQueue.global().async {
        DispatchQueue.main.async {
            button.setBackgroundColor(getNextColor(), forState: .normal)
        }
    }
}
//#-end-editable-code
/*:
 The crash function demonstrates what happens when a thread other than the main thread accesses a UI element
 */
//#-editable-code
func crash(button: UIButton) {
    DispatchQueue.global().async {
        button.setBackgroundColor(getNextColor(), forState: .normal)
    }
}
//#-end-editable-code
/*:
 */
//#-editable-code
let demo = Demo()
demo.buttonListener = { button in
    let action = Demo.Action(rawValue: button.tag)!
    print("\n\nProcessing \(action) action")
    
    switch action {
        
    case .succeed: succeed(button: button)

    case .crash: crash(button: button)
    }
    
    print("\n\(action) action processing completed")
}
//#-end-editable-code
PlaygroundPage.current.needsIndefiniteExecution = true
PlaygroundPage.current.liveView = demo
//: [Concurrancy](@next)

