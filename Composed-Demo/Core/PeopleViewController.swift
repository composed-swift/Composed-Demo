import UIKit
import Composed
import ComposedUI

class PeopleViewController: UIViewController {

    let provider = PeopleComposedSectionProvider()

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
