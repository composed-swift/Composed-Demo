import Composed
import ComposedLayouts
import ComposedUI
import UIKit

final class SingleRandomElementSection: SingleElementSection<String> {
    init() {
        super.init(element: UUID().uuidString)
    }
}

extension SingleRandomElementSection: CollectionSectionProvider {
    func section(with traitCollection: UITraitCollection) -> CollectionSection {
        let cell = CollectionCellElement(section: self, dequeueMethod: .fromNib(PersonCollectionCell.self), reuseIdentifier: "PersonCell") { cell, index, section in
            cell.titleLabel.text = section.element
            cell.insertionHandler = { [weak self] person in
                guard let self = self else { return }
                self.replace(element: UUID().uuidString)
            }

            cell.deletionHandler = { [weak self] person in
                guard let self = self else { return }
                self.replace(element: UUID().uuidString)
            }
        }

        return CollectionSection(section: self, cell: cell, header: nil)
    }
}

extension SingleRandomElementSection: CollectionFlowLayoutHandler {
    func sizingStrategy(at index: Int, metrics: CollectionFlowLayoutMetrics, environment: CollectionFlowLayoutEnvironment) -> CollectionFlowLayoutSizingStrategy? {
        return CollectionFlowLayoutSizingStrategy(columnCount: 1, //Int(floor(environment.contentSize.width / 320)),
            sizingMode: .automatic(isUniform: true, prototype: PersonCollectionCell.fromNib),
            metrics: metrics)
    }

}
