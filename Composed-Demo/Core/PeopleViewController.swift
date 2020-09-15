import UIKit
import Composed
import ComposedUI

class PeopleViewController: UIViewController {

    private(set) lazy var provider = PeopleComposedSectionProvider(controller: self)

    override func viewDidLoad() {
        super.viewDidLoad()
        appendSection()
        provider.append(ZeroHeightSection(parent: provider))
        appendSection()
        appendSection()
    }

    @IBAction func appendSection() {
        provider.append()
    }

    @IBAction func removeSection() {
        guard provider.numberOfSections > 0 else { return }
        provider.remove(at: provider.numberOfSections - 1)
    }

}
