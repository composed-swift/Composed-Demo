import UIKit
import Composed
import ComposedUI

class PeopleViewController: UIViewController {

    let provider = PeopleComposedSectionProvider()

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.leftBarButtonItem = editButtonItem
    }

    @IBAction private func appendSection() {
        provider.append()
    }

    @IBAction private func removeSection() {
        provider.remove(at: children.count - 1)
    }

}
