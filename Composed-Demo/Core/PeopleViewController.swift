import UIKit
import Composed
import ComposedUI

class PeopleViewController: UIViewController {
    let provider = PeopleComposedSectionProvider()

    @IBAction private func appendSection() {
        provider.append()
    }

    @IBAction private func removeSection() {
        provider.remove(at: provider.sections.count - 1)
    }

}
