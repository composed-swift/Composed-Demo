import UIKit
import Composed
import ComposedUI

final class PeopleCollectionViewController: UICollectionViewController {

    private lazy var coordinator: CollectionCoordinator = {
        return CollectionCoordinator(collectionView: collectionView, sectionProvider: sectionProvider)
    }()

    private lazy var sectionProvider: ComposedSectionProvider = {
        let provider = ComposedSectionProvider()
        provider.append(family)
        provider.append(friends)
        return provider
    }()

    private lazy var family: PeopleSection = {
        return PeopleSection(elements: [
            "Anne",
            "Shaps",
            "Anton",
        ])
    }()

    private lazy var friends: PeopleSection = {
        return PeopleSection(elements: [
            "Joseph",
            "Francesco",
        ])
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

    }

}
