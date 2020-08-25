import UIKit
import Composed
import ComposedUI

class PeopleViewController: UIViewController {

    private(set) lazy var provider = PeopleComposedSectionProvider(controller: self)

    override func viewDidLoad() {
        super.viewDidLoad()
        appendSection()
        appendSection()
        appendSection()
    }

    @IBAction func appendSection() {
        provider.append()
    }

    @IBAction func removeSection() {
        provider.currentIndex = provider.children.indices.randomElement() ?? 0
    }

}
