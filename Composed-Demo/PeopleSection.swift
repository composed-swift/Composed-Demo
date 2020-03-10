import UIKit
import Composed
import ComposedUI
import ComposedLayouts

struct Person: Equatable {
    var id: UUID
    var name: String

    init(name: String) {
        id = UUID()
        self.name = name
    }
}

final class PeopleComposedSectionProvider: ComposedSectionProvider {

    private func peopleSection() -> PeopleSection {
        let count = (1..<10).randomElement() ?? 5
        let names = (0..<count).map {
            $0 % 2 == 0 ? Lorem.fullName : Lorem.firstName
        }
        return PeopleSection(parent: self, elements: names.map { Person(name: $0) })
    }

    func append(after section: PeopleSection) {
        let index = sections.firstIndex(where: { $0 === section }) ?? sections.count - 1
        insert(peopleSection(), at: index)
    }

    func append() {
        append(peopleSection())
    }

}

protocol PeopleEditingView: class {
    var titleLabel: UILabel! { get }
    var person: Person? { get set }
    var insertionHandler: ((Person?) -> Void)? { get set }
    var deletionHandler: ((Person?) -> Void)? { get set }
}

extension PersonTableHeader: PeopleEditingView { }
extension PersonTableCell: PeopleEditingView { }
extension PersonCollectionHeader: PeopleEditingView { }
extension PersonCollectionCell: PeopleEditingView { }

extension PeopleSection {
    func prepare(header: PeopleEditingView) {
        header.insertionHandler = { [unowned self] person in
            self.parent?.append(after: self)
        }

        header.deletionHandler = { [unowned self] person in
            self.parent?.remove(self)
        }
    }

    func prepare(cell: PeopleEditingView, at index: Int) {
        let person = element(at: index)

        cell.titleLabel.text = person.name
        cell.person = person

        cell.insertionHandler = { [unowned self] person in
            let index = person.flatMap { self.firstIndex(of: $0) } ?? index
            self.insert(Person(name: Lorem.fullName), at: index + 1)
        }

        cell.deletionHandler = { [unowned self] person in
            if self.count == 1 {
                self.parent?.remove(self)
            } else {
                self.remove(at: person.flatMap { self.firstIndex(of: $0) } ?? index)
            }
        }
    }
}

final class PeopleSection: ArraySection<Person> {

    private let prototype = PersonCollectionCell.fromNib
    fileprivate weak var parent: PeopleComposedSectionProvider?

    convenience init(parent: PeopleComposedSectionProvider, elements: [Person]) {
        self.init(elements)
        self.parent = parent
    }

}

extension PeopleSection: TableSectionProvider {

    func section(with traitCollection: UITraitCollection) -> TableSection {
        let header = TableElement(section: self, dequeueMethod: .nib(PersonTableHeader.self)) { view, _, section in
            section.prepare(header: view)
        }

        let cell = TableElement(section: self, dequeueMethod: .storyboard(PersonTableCell.self), reuseIdentifier: "Cell") { cell, index, section in
            section.prepare(cell: cell, at: index)
        }

        return TableSection(section: self, cell: cell, header: .element(header))
    }

}

extension PeopleSection: TableEditingHandler {
    func allowsEditing(at index: Int) -> Bool { return true }
    func editingStyle(at index: Int) -> UITableViewCell.EditingStyle { return .delete }
    func commitEditing(at index: Int, editingStyle: UITableViewCell.EditingStyle) { remove(at: index) }
}

extension PeopleSection: CollectionSectionProvider {

    private var metrics: CollectionFlowLayoutMetrics {
        var metrics = CollectionFlowLayoutMetrics()
        metrics.contentInsets = .init(top: 20, left: 0, bottom: 20, right: 0)
        return metrics
    }

    func section(with traitCollection: UITraitCollection) -> CollectionSection {
        let header = CollectionSupplementaryElement(section: self, dequeueMethod: .nib(PersonCollectionHeader.self)) { view, _, section in
            section.prepare(header: view)
        }

        let cell = CollectionCellElement(section: self, dequeueMethod: .nib(PersonCollectionCell.self), reuseIdentifier: "PersonCell") { cell, index, section in
            section.prepare(cell: cell, at: index)
        }

        return CollectionSection(section: self, cell: cell, header: header)
    }

}

extension PeopleSection: CollectionFlowLayoutHandler {

    func layoutMetrics(suggested: CollectionFlowLayoutMetrics, environment: CollectionFlowLayoutEnvironment) -> CollectionFlowLayoutMetrics {
        return metrics
    }

    func sizingStrategy(at index: Int, metrics: CollectionFlowLayoutMetrics, environment: CollectionFlowLayoutEnvironment) -> CollectionFlowLayoutSizingStrategy? {
        prototype.titleLabel.text = element(at: index).name
        return CollectionFlowLayoutSizingStrategy(prototype: prototype,
                                                  columnCount: Int(floor(environment.contentSize.width / 320)),
                                                  sizingMode: .automatic(isUniform: true),
                                                  metrics: metrics)
    }

}

protocol CollectionSelectableSection: Section {
    func didSelect(at index: Int)
}
