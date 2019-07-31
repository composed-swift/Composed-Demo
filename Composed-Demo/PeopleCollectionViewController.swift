import UIKit
import Composed
import ComposedUI
import FlowLayout

final class PeopleCollectionViewController: UICollectionViewController {

    private var coordinator: CollectionCoordinator?

    private var flowLayout: FlowLayout {
        return collectionViewLayout as! FlowLayout
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        coordinator = CollectionCoordinator(collectionView: collectionView, sectionProvider: People.provider)
    }

    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        super.viewWillTransition(to: size, with: coordinator)
        flowLayout.invalidateLayout()
    }
    
}
