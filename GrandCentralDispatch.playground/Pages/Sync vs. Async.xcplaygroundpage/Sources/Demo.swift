import UIKit

public class Demo : BaseDemo {
    
    public enum Action: Int {
        case sync = 1
        case async
    }
    
    override public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    
    override public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let buttonCell = super.tableView(tableView, cellForRowAt: indexPath) as! ButtonCell
        
        let button = buttonCell.button
        switch indexPath.item {
        case 0:
            button.tag = Action.sync.rawValue
            button.setTitle("Sync", for: .normal)
        case 1:
            button.tag = Action.async.rawValue
            button.setTitle("Async", for: .normal)
        default:
            break
        }
        
        return buttonCell
    }
}
