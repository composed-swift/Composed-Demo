import UIKit
import ComposedUI

final class PersonTableHeader: UITableViewHeaderFooterView, NibLoadable {
    @IBOutlet weak var titleLabel: UILabel!

    var person: Person?
    
    var insertionHandler: ((Person?) -> Void)?
    var deletionHandler: ((Person?) -> Void)?

    @IBAction private func handleInsert(_ button: UIButton) {
        insertionHandler?(person)
    }

    @IBAction private func handleDelete(_ button: UIButton) {
        deletionHandler?(person)
    }
}

final class PersonTableCell: UITableViewCell {

    @IBOutlet weak var titleLabel: UILabel!

    var person: Person?

    var insertionHandler: ((Person?) -> Void)?
    var deletionHandler: ((Person?) -> Void)?

    @IBAction private func handleInsert(_ button: UIButton) {
        insertionHandler?(person)
    }

    @IBAction private func handleDelete(_ button: UIButton) {
        deletionHandler?(person)
    }

}
