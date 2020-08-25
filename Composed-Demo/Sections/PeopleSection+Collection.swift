import UIKit
import Composed
import ComposedUI
import ComposedLayouts
import ComposedMediaUI

extension PeopleSection: CollectionSectionProvider {

    private var metrics: CollectionFlowLayoutMetrics {
        var metrics = CollectionFlowLayoutMetrics()
        metrics.contentInsets = .init(top: 0, left: 0, bottom: 20, right: 0)
        return metrics
    }

    func section(with traitCollection: UITraitCollection) -> CollectionSection {
        let header = CollectionSupplementaryElement(section: self, dequeueMethod: .fromNib(PersonCollectionHeader.self)) { view, _, section in
            section.prepare(header: view)
        }

        let cell = CollectionCellElement(section: self, dequeueMethod: .fromNib(PersonCollectionCell.self), reuseIdentifier: "PersonCell") { cell, index, section in
            section.prepare(cell: cell, at: index)
        }

        return CollectionSection(section: self, cell: cell, header: header)
    }

}

extension PeopleSection: CollectionFlowLayoutHandler {

    func layoutMetrics(suggested: CollectionFlowLayoutMetrics, environment: CollectionFlowLayoutEnvironment) -> CollectionFlowLayoutMetrics {
        return metrics
    }

    func referenceHeaderSize(suggested: CGSize, environment: CollectionFlowLayoutEnvironment) -> CGSize {
        let target = CGSize(width: environment.contentSize.width, height: 0)
        return prototypeHeader.systemLayoutSizeFitting(target, withHorizontalFittingPriority: .required, verticalFittingPriority: .fittingSizeLevel)
    }

    func sizingStrategy(at index: Int, metrics: CollectionFlowLayoutMetrics, environment: CollectionFlowLayoutEnvironment) -> CollectionFlowLayoutSizingStrategy? {
        prototypeCell.titleLabel.text = element(at: index).name
        return CollectionFlowLayoutSizingStrategy(columnCount: 1, //Int(floor(environment.contentSize.width / 320)),
            sizingMode: .automatic(isUniform: true, prototype: prototypeCell),
            metrics: metrics)
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

