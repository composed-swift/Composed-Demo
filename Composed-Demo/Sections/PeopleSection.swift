import UIKit
import Photos
import Composed
import ComposedUI
import ComposedLayouts
import ComposedMediaUI
import QuickLook

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
    private var previewAsssets: [NSURL] = []

    convenience init(parent: PeopleComposedSectionProvider, elements: [Person], controller: UIViewController?) {
        self.init(elements)
        self.parent = parent
        self.controller = controller
    }

}

extension PeopleSection: MediaPickerDelegate {

    func mediaPicker(_ controller: MediaViewController, didPickAssets assets: [PHAsset]) {
        previewAsssets.removeAll()
        let caches = NSSearchPathForDirectoriesInDomains(.cachesDirectory, .userDomainMask, true).first!

        self.controller?.dismiss(animated: true) {
            let preview = QLPreviewController()
            preview.dataSource = self
            self.controller?.present(preview, animated: true, completion: nil)

            assets.enumerated().forEach { asset in
                PHImageManager.default().requestImageData(for: asset.element, options: nil) { [weak self] data, _, _, info in
                    do {
                        let url = URL(fileURLWithPath: caches)
                            .appendingPathComponent("\(asset.offset).jpg")
                        try data?.write(to: url)
                        self?.previewAsssets.append(url as NSURL)
                        preview.reloadData()
                    } catch {
                        print(error)
                    }
                }
            }
        }
    }

    func mediaPickerWasCancelled(_ controller: MediaViewController) {
        self.controller?.dismiss(animated: true, completion: nil)
    }

}

extension PeopleSection: QLPreviewControllerDataSource {

    func previewController(_ controller: QLPreviewController, previewItemAt index: Int) -> QLPreviewItem {
        return previewAsssets[index]
    }

    func numberOfPreviewItems(in controller: QLPreviewController) -> Int {
        return previewAsssets.count
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

extension PeopleSection: CollectionDragHandler {
    func dragSession(_ session: UIDragSession, dragItemsForBeginning index: Int) -> [UIDragItem] {
        let data = Data()
        let provider = NSItemProvider(item: data as NSData, typeIdentifier: "data")
        let item = UIDragItem(itemProvider: provider)
        item.localObject = index
        return [item]
    }
}

extension PeopleSection: MoveHandler {

    func canMove(index: Int) -> Bool {
        return true
    }

    func didMove(sourceIndexes: IndexSet, to destinationIndex: Int) {
        sourceIndexes.forEach {
            commitInteractiveMove(from: $0, to: destinationIndex)
        }
    }

}
