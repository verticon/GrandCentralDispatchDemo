import UIKit

public class Demo : BaseDemo {
    
    public enum Action: Int {
        case byQueue = 1
        case byItemSerially
        case byItemConcurrently
    }
    
    override public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    override public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let buttonCell = super.tableView(tableView, cellForRowAt: indexPath) as! ButtonCell
        
        let button = buttonCell.button
        switch indexPath.item {
        case 0:
            button.tag = Action.byQueue.rawValue
            button.setTitle("By Queue", for: .normal)
        case 1:
            button.tag = Action.byItemSerially.rawValue
            button.setTitle("By Item (Serially)", for: .normal)
        case 2:
            button.tag = Action.byItemConcurrently.rawValue
            button.setTitle("By Item (Concurrently)", for: .normal)
        default:
            break
        }
        
        return buttonCell
    }
}
