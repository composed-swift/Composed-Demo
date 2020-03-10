import UIKit
import Composed
import ComposedUI

final class PeopleStackViewController: PeopleViewController {

    @IBOutlet private weak var stackView: ComposedStackView!
    private var coordinator: StackCoordinator?

    override func viewDidLoad() {
        super.viewDidLoad()
        coordinator = StackCoordinator(stackView: stackView, sectionProvider: provider)
    }

}
