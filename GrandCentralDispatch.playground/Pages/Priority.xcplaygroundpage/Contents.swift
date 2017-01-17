//: [Sync vs. Async](@previous)
import UIKit
import PlaygroundSupport
/*:
 The byQueue and byItem functions demonstrate that higher priority work will be executed before lower priority work. They each submit an item for each of the possible qos values. byQueue submits items to the global queue with the corresponding qos. byItem uses the default global queue and then specifies a qos for each of the submitted items. Both functions specify a future execution time in order to ensure that all of the items have been submitted before any are chosen for execution.
 
 ToDo: These methods do not produce the expected result.
 */
//#-editable-code
func byQueue() {
    let when: DispatchTime = .now() + .milliseconds(500)
    let priorities: [DispatchQoS.QoSClass] = [.background, .default, .utility, .userInitiated, .userInteractive]
    for qos in priorities {
        let queue = DispatchQueue.global(qos: qos)
        print("\tSubmitting to \(queue.label) queue")
        queue.asyncAfter(deadline: when) {
            print("\tPerforming work on \(queue.label) queue")
        }
    }
}
func byItem(queue: DispatchQueue) {
    let when: DispatchTime = .now() + .milliseconds(500)
    let priorities: [DispatchQoS] = [.background, .utility, .default, .userInitiated, .userInteractive]
    for qos in priorities {
        print("\tSubmitting \(qos.qosClass) item")
        queue.asyncAfter(deadline: when, qos: qos) {
            print("\tPerforming \(qos.qosClass) work on \(queue.label) queue")
        }
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
    case .byQueue: byQueue()
    case .byItemSerially: byItem(queue: DispatchQueue(label: "My Serial Queue"))
    case .byItemConcurrently: byItem(queue: DispatchQueue.global())
    }
    print("\(action) action processing completed")
}
//#-end-editable-code
PlaygroundPage.current.needsIndefiniteExecution = true
PlaygroundPage.current.liveView = demo

//: [UI Responsiveness](@next)
