import UIKit
import Composed
import ComposedUI

final class NavigationController: UINavigationController {

    override var childForStatusBarStyle: UIViewController? { return topViewController }
    override var childForHomeIndicatorAutoHidden: UIViewController? { return topViewController }
    override var childForStatusBarHidden: UIViewController? { return topViewController }
    override var childForScreenEdgesDeferringSystemGestures: UIViewController? { return topViewController }

}

final class PeopleCollectionViewController: UICollectionViewController {

    private var coordinator: CollectionCoordinator?

    override func viewDidLoad() {
        super.viewDidLoad()
        coordinator = CollectionCoordinator(collectionView: collectionView, sectionProvider: People.provider)
    }

    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        super.viewWillTransition(to: size, with: coordinator)
        guard size.width != collectionView.bounds.width else { return }

        coordinator.animate(alongsideTransition: { _ in
            self.collectionView.collectionViewLayout.invalidateLayout()
        }, completion: nil)
    }

    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        return .all
    }

}
