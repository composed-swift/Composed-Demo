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

}
