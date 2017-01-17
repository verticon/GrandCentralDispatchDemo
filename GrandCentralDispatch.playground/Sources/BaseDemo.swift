import UIKit

open class BaseDemo: UIViewController {
    
    public var buttonListener: ((UIButton) -> Void)?

    fileprivate let buttonCellReuseId = "ButtonCell"
    private var table: UITableView!
    private var tableHeightConstraint: NSLayoutConstraint!
    private var console: UITextView!
    
    override open func viewDidLoad() {
        super.viewDidLoad()
        
        table = UITableView()
        table.tableFooterView = UIView()
        table.register(ButtonCell.self, forCellReuseIdentifier: buttonCellReuseId)
        table.dataSource = self
        table.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(table)
        
        console = UITextView()
        console.isEditable = false
        console.isScrollEnabled = true
        console.isUserInteractionEnabled = true
        console.showsHorizontalScrollIndicator = true
        console.showsVerticalScrollIndicator = true
        console.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(console)
        
        var constraints = [NSLayoutConstraint]()
        
        constraints.append(table.topAnchor.constraint(equalTo: view.topAnchor))
        constraints.append(table.leadingAnchor.constraint(equalTo: view.leadingAnchor))
        constraints.append(table.trailingAnchor.constraint(equalTo: view.trailingAnchor))
        tableHeightConstraint = table.heightAnchor.constraint(equalToConstant: view.bounds.height/2)
        constraints.append(tableHeightConstraint)
        
        constraints.append(console.topAnchor.constraint(equalTo: table.bottomAnchor))
        constraints.append(console.leadingAnchor.constraint(equalTo: view.leadingAnchor))
        constraints.append(console.trailingAnchor.constraint(equalTo: view.trailingAnchor))
        constraints.append(console.bottomAnchor.constraint(equalTo: view.bottomAnchor))
        
        NSLayoutConstraint.activate(constraints)

        printer = self
    }

    override open func viewDidAppear(_ animated: Bool) {
        tableHeightConstraint.constant = self.table.contentSize.height
    }
    
    public func print(_ text: String) {
        DispatchQueue.main.async {
            self.console.text.append(text)
        }
    }
}

extension BaseDemo : UITableViewDataSource {
    
    public func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    open func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    open func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier:buttonCellReuseId, for: indexPath) as! ButtonCell
        if cell.button.tag == 0 {
            cell.button.addTarget(self, action: #selector(takeAction), for: .touchUpInside)
        }
        return cell
    }
    
    @objc private func takeAction(sender: UIButton) {
        if let listener = buttonListener {
            listener(sender)
        }
    }
}

