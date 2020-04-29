import UIKit
import Composed
import ComposedUI

final class PeopleCollectionViewController: PeopleViewController, UICollectionViewDelegate {

    @IBOutlet private weak var collectionView: UICollectionView!
    private var coordinator: CollectionCoordinator?

    override func viewDidLoad() {
        super.viewDidLoad()
        coordinator = CollectionCoordinator(collectionView: collectionView, sectionProvider: provider)
        collectionView.delegate = self
    }

    /// Required specifically for `UICollectionViewFlowLayout` since some rotations don't cause an invalidation!?
    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        super.viewWillTransition(to: size, with: coordinator)
        self.coordinator?.invalidateLayout()
    }

}

extension PeopleCollectionViewController: UICollectionViewDropDelegate {

    func collectionView(_ collectionView: UICollectionView, performDropWith coordinator: UICollectionViewDropCoordinator) {

    }

    func collectionView(_ collectionView: UICollectionView, dropSessionDidUpdate session: UIDropSession, withDestinationIndexPath destinationIndexPath: IndexPath?) -> UICollectionViewDropProposal {
        return UICollectionViewDropProposal(operation: .copy)
    }

    func collectionView(_ collectionView: UICollectionView, canHandle session: UIDropSession) -> Bool {
        return true
    }

}
