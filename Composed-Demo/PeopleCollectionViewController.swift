import UIKit
import Composed
import ComposedUI
import FlowLayout

final class PeopleCollectionViewController: UICollectionViewController {

    private var coordinator: CollectionCoordinator?

    override func viewDidLoad() {
        super.viewDidLoad()
        coordinator = CollectionCoordinator(collectionView: collectionView, sectionProvider: People.provider)
        collectionView.backgroundColor = .groupTableViewBackground
    }
    
}
