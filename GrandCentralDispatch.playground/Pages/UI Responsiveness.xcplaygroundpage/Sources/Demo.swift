import UIKit

public class Demo : BaseDemo {
    
    public enum Action: Int {
        case changeColor = 1
        case playNice
        case playRude
    }

    override public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    override public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let buttonCell = super.tableView(tableView, cellForRowAt: indexPath) as! ButtonCell

        let button = buttonCell.button
        switch indexPath.item {
        case 0:
            button.tag = Action.changeColor.rawValue
            button.setTitle("Color", for: .normal)
        case 1:
            button.tag = Action.playNice.rawValue
            button.setTitle("Nice", for: .normal)
        case 2:
            button.tag = Action.playRude.rawValue
            button.setTitle("Rude", for: .normal)
        default:
            break
        }

        return buttonCell
    }
}
