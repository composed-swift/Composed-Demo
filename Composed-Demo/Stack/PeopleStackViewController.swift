import UIKit
import Composed
import ComposedUI

final class PeopleStackViewController: PeopleViewController {

    private var composedView: ComposedView {
        return view as! ComposedView
    }

    private var coordinator: StackCoordinator?

    override func viewDidLoad() {
        super.viewDidLoad()
        coordinator = StackCoordinator(composedView: composedView, sectionProvider: provider)
        composedView.contentInsets.bottom = 20
    }

}
