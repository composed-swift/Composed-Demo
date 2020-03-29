import UIKit
import Photos
import Composed
import ComposedUI
import ComposedLayouts
import ComposedMediaUI

struct Person: Equatable {
    var id: UUID
    var name: String

    init(name: String) {
        id = UUID()
        self.name = name
    }
}

final class PeopleSection: ArraySection<Person> {

    let prototypeCell = PersonCollectionCell.fromNib
    let prototypeHeader = PersonCollectionHeader.fromNib

    private(set) weak var parent: PeopleComposedSectionProvider?
    weak var controller: UIViewController?

    convenience init(parent: PeopleComposedSectionProvider, elements: [Person], controller: UIViewController?) {
        self.init(elements)
        self.parent = parent
        self.controller = controller
    }

}

extension PeopleSection: MediaPickerDelegate {

    func mediaPicker(_ controller: MediaViewController, didPickAssets assets: [PHAsset]) {
        self.controller?.dismiss(animated: true, completion: nil)
    }

    func mediaPickerWasCancelled(_ controller: MediaViewController) {
        self.controller?.dismiss(animated: true, completion: nil)
    }

}

final class PeopleComposedSectionProvider: ComposedSectionProvider {

    private weak var controller: UIViewController?

    init(controller: UIViewController?) {
        self.controller = controller
        super.init()
    }

    private func peopleSection() -> PeopleSection {
        let count = (1..<10).randomElement() ?? 5
        let names = (0..<count).map {
            $0 % 2 == 0 ? Lorem.fullName : Lorem.firstName
        }
        return PeopleSection(parent: self, elements: names.map { Person(name: $0) }, controller: controller)
    }

    func append(after section: PeopleSection) {
        let index = sections.firstIndex(where: { $0 === section }) ?? sections.count - 1
        insert(peopleSection(), at: index)
    }

    func append() {
        append(peopleSection())
    }

}

extension PeopleSection: CollectionSelectionHandler {

    func didSelect(at index: Int, cell: UICollectionViewCell) {
        let media = MediaViewController()
        media.pickerDelegate = self

        let nav = UINavigationController(rootViewController: media)
        nav.modalPresentationStyle = .popover
        nav.popoverPresentationController?.sourceView = cell
        nav.popoverPresentationController?.sourceRect = cell.bounds
        controller?.present(nav, animated: true, completion: nil)
    }

}
