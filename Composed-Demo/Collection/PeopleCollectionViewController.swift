import UIKit
import Composed
import ComposedUI

final class PeopleCollectionViewController: PeopleViewController {

    @IBOutlet private weak var collectionView: UICollectionView!
    private var coordinator: CollectionCoordinator?

    override func viewDidLoad() {
        super.viewDidLoad()
        coordinator = CollectionCoordinator(collectionView: collectionView, sectionProvider: provider)
    }

    /// Required specifically for `UICollectionViewFlowLayout` since some rotations don't cause an invalidation!?
    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        super.viewWillTransition(to: size, with: coordinator)
        self.coordinator?.invalidateLayout()
        
    }

}
