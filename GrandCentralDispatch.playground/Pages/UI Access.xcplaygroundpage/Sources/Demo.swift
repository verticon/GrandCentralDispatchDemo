import UIKit

public class Demo : BaseDemo {
    
    public enum Action: Int {
        case crash = 1
        case succeed
    }

    override public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    
    override public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let buttonCell = super.tableView(tableView, cellForRowAt: indexPath) as! ButtonCell
        
        let button = buttonCell.button
        switch indexPath.item {
        case 0:
            button.tag = Action.crash.rawValue
            button.setTitle("Crash", for: .normal)
        case 1:
            button.tag = Action.succeed.rawValue
            button.setTitle("Succeed", for: .normal)
        default:
            break
        }
        
        return buttonCell
    }
}
