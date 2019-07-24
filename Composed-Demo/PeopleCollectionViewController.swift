import UIKit
import Composed
import ComposedUI

final class PeopleCollectionViewController: UICollectionViewController {

    private var coordinator: CollectionCoordinator?

    override func viewDidLoad() {
        super.viewDidLoad()
        coordinator = CollectionCoordinator(collectionView: collectionView, sectionProvider: People.provider)
    }
}
