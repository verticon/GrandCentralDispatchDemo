import UIKit

public class Demo : BaseDemo {
    
    public enum Action: Int {
        case inline = 1
        case serial
        case concurrent
    }

    override public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    override public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let buttonCell = super.tableView(tableView, cellForRowAt: indexPath) as! ButtonCell

        let button = buttonCell.button
        switch indexPath.item {
        case 0:
            button.tag = Action.inline.rawValue
            button.setTitle("Inline", for: .normal)
        case 1:
            button.tag = Action.serial.rawValue
            button.setTitle("Serial", for: .normal)
        case 2:
            button.tag = Action.concurrent.rawValue
            button.setTitle("Concurrent", for: .normal)
        default:
            break
        }
        
        return buttonCell
    }
}
