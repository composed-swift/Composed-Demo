import UIKit
import Composed
import ComposedUI
import ComposedLayouts

final class PeopleSection: ArraySection<String> {

    let title: String
    private let prototype = PersonCollectionCell.fromNib

    init(title: String, elements: [String]) {
        self.title = title
        super.init(elements: elements)
    }

}

extension PeopleSection: TableSectionProvider {

    func section(with traitCollection: UITraitCollection) -> TableSection {
        let cell = TableElement(section: self, dequeueMethod: .storyboard(UITableViewCell.self), reuseIdentifier: "Cell") { cell, index, section in
            let person = section.element(at: index)
            cell.textLabel?.text = person
            cell.detailTextLabel?.text = "12"
        }

        return TableSection(section: self, cell: cell, header: .title(title))
    }

}

extension PeopleSection: CollectionSectionProvider {

    private var metrics: CollectionFlowLayoutMetrics {
        var metrics = CollectionFlowLayoutMetrics()
        metrics.contentInsets = .init(top: 20, left: 0, bottom: 20, right: 0)
        return metrics
    }

    func section(with traitCollection: UITraitCollection) -> CollectionSection {
        let cell = CollectionCellElement(section: self, dequeueMethod: .nib(PersonCollectionCell.self), reuseIdentifier: "PersonCell") { cell, index, section in
            let person = section.element(at: index)
            cell.titleLabel.text = person
        }

        return CollectionSection(section: self, cell: cell)
    }

}

extension PeopleSection: CollectionFlowLayoutHandler {

    func layoutMetrics(suggested: CollectionFlowLayoutMetrics, environment: CollectionFlowLayoutEnvironment) -> CollectionFlowLayoutMetrics {
        return metrics
    }

    func sizingStrategy(at index: Int, metrics: CollectionFlowLayoutMetrics, environment: CollectionFlowLayoutEnvironment) -> CollectionFlowLayoutSizingStrategy? {
        prototype.titleLabel.text = element(at: index)
        return CollectionFlowLayoutSizingStrategy(prototype: prototype,
                                                  columnCount: 1,
                                                  sizingMode: .automatic(isUniform: true),
                                                  metrics: metrics)
    }

}
