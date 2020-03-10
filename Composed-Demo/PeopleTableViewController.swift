import UIKit
import Composed
import ComposedUI

final class PeopleTableViewController: PeopleViewController {

    @IBOutlet private weak var tableView: UITableView!
    private var coordinator: TableCoordinator?

    override func viewDidLoad() {
        super.viewDidLoad()
        coordinator = TableCoordinator(tableView: tableView, sectionProvider: provider)
    }

    override func setEditing(_ editing: Bool, animated: Bool) {
        super.setEditing(editing, animated: animated)
        tableView.setEditing(editing, animated: animated)
    }

}
