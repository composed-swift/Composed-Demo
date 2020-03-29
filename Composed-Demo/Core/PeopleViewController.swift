import UIKit
import Composed
import ComposedUI

class PeopleViewController: UIViewController {

    private(set) lazy var provider = PeopleComposedSectionProvider(controller: self)

    override func viewDidLoad() {
        super.viewDidLoad()
        appendSection()
    }

    @IBAction func appendSection() {
        provider.append()
    }

    @IBAction func removeSection() {
        guard let section = provider.sections.last as? PeopleSection else { return }
        section.removeAll()
    }

}
