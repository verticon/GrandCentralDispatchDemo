import UIKit

public class ButtonCell : UITableViewCell {
    
    public let button = UIButton()
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        
        super.init(style: .subtitle, reuseIdentifier: reuseIdentifier)
        
        setupButton()
    }
    
    required public init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupButton() {
        
        self.contentView.addSubview(button)
        
        button.setBackgroundColor(.lightGray, forState: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.layer.cornerRadius = 5
        button.clipsToBounds = true
        
        var constraints = [NSLayoutConstraint]()
        constraints.append(button.leadingAnchor.constraint(equalTo:self.leadingAnchor, constant:5))
        constraints.append(button.trailingAnchor.constraint(equalTo:self.trailingAnchor, constant: -5))
        constraints.append(button.topAnchor.constraint(equalTo:self.topAnchor, constant: 5))
        constraints.append(button.bottomAnchor.constraint(equalTo:self.bottomAnchor, constant: -5))
        NSLayoutConstraint.activate(constraints)
    }
}

