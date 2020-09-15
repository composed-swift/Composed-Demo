import UIKit
import Composed
import ComposedUI
import ComposedLayouts
import ComposedMediaUI

final class ZeroHeightSection: ArraySection<String>, CollectionSectionProvider, CollectionFlowLayoutHandler {
    let prototypeCell = PersonCollectionCell.fromNib
    let prototypeHeader = PersonCollectionHeader.fromNib
    private(set) weak var parent: PeopleComposedSectionProvider?

    required init(parent: PeopleComposedSectionProvider) {
        self.parent = parent

        super.init(arrayLiteral: "Test")
    }
    
    required init() {
        fatalError("init() has not been implemented")
    }
    
    required init(arrayLiteral elements: Element...) {
        fatalError("init(arrayLiteral:) has not been implemented")
    }
    
    private var metrics: CollectionFlowLayoutMetrics {
        var metrics = CollectionFlowLayoutMetrics()
        metrics.contentInsets = .init(top: 0, left: 0, bottom: 20, right: 0)
        return metrics
    }

    func prepare(header: PeopleEditingView) {
        header.titleLabel.text = "Zero Height Cell"
        header.deletionHandler = { [unowned self] person in
            self.parent?.remove(self)
        }
    }

    func section(with traitCollection: UITraitCollection) -> CollectionSection {
        let header = CollectionSupplementaryElement(section: self, dequeueMethod: .fromNib(PersonCollectionHeader.self)) { view, _, section in
            section.prepare(header: view)
        }
        let cell = CollectionCellElement(section: self, dequeueMethod: .fromClass(UICollectionViewCell.self)) { cell, index, section in
            
        }

        return CollectionSection(section: self, cell: cell, header: header)
    }

    func referenceHeaderSize(suggested: CGSize, environment: CollectionFlowLayoutEnvironment) -> CGSize {
        let target = CGSize(width: environment.contentSize.width, height: 0)
        return prototypeHeader.systemLayoutSizeFitting(target, withHorizontalFittingPriority: .required, verticalFittingPriority: .fittingSizeLevel)
    }

    func sizingStrategy(at index: Int, metrics: CollectionFlowLayoutMetrics, environment: CollectionFlowLayoutEnvironment) -> CollectionFlowLayoutSizingStrategy? {
        return CollectionFlowLayoutSizingStrategy(
            columnCount: 1,
            sizingMode: .fixed(height: 0),
            metrics: metrics
        )
    }
}
