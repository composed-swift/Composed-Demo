import UIKit
import Composed
import ComposedUI

final class PeopleTableViewController: UITableViewController {

    private var coordinator: TableCoordinator?

    override func viewDidLoad() {
        super.viewDidLoad()
        coordinator = TableCoordinator(tableView: tableView, sectionProvider: People.provider)
    }

}
