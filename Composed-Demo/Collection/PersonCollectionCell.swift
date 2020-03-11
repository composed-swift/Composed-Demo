import UIKit
import ComposedUI

final class PersonCollectionHeader: UICollectionReusableView, NibLoadable {
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

final class PersonCollectionCell: UICollectionViewCell, NibLoadable {
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var separatorView: UIView!
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
