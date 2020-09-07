import UIKit
import Composed
import ComposedUI

class PeopleViewController: UIViewController {

    private(set) lazy var composedProvider = ComposedSectionProvider()
    private(set) lazy var peopleProvider = PeopleComposedSectionProvider(controller: self)

    override func viewDidLoad() {
        super.viewDidLoad()

        composedProvider.append(peopleProvider)

        appendSection()
        appendSection()
        appendSection()
    }

    @IBAction func appendSection() {
        peopleProvider.append()
    }

    @IBAction func removeSection() {
        peopleProvider.currentIndex = peopleProvider.children.indices.randomElement() ?? 0
    }

}
