import UIKit
import Composed
import ComposedUI

final class People {
    static var provider: SectionProvider {
        let provider = ComposedSectionProvider()

        provider.append(PeopleSection(title: "Family", elements: [
            "Anne",
            "Shaps",
            "Anton",
        ]))

        provider.append(PeopleSection(title: "Friends", elements: [
            "Joseph",
            "Francesco",
        ]))

        return provider
    }
}

final class PeopleSection: ArraySection<String> {

    let title: String
    private var tableSection: TableSection?
    private var collectionSection: CollectionSection?

    init(title: String, elements: [String]) {
        self.title = title
        super.init(elements: elements)
    }

}

extension PeopleSection: TableSectionProvider {

    // update header/footer to take an enum that's either a title or an element rather than a separate initializer

    func section(with environment: Environment) -> TableSection {
        if let section = tableSection { return section }

        let section = TableSection(section: self, prototype: UITableViewCell(style: .default, reuseIdentifier: "UITableViewCell"), cellDequeueMethod: .class(UITableViewCell.self), cellConfigurator: { cell, index, section, _ in
            let person = section.element(at: index)
            cell.textLabel?.text = person
        }, header: .title(title))

        tableSection = section
        return section
    }

}

extension PeopleSection: CollectionSectionProvider {

    func section(with environment: Environment) -> CollectionSection {
        if let section = collectionSection { return section }

        let section = CollectionSectionFlowLayout(section: self, prototype: PersonCollectionCell.fromNib, cellDequeueMethod: .nib(PersonCollectionCell.self), cellConfigurator: { cell, index, section, context in
            let person = section.element(at: index)
            cell.titleLabel.text = person

            guard context == .presentation else { return }
        }, sectionInsets: UIEdgeInsets(top: 20, left: 0, bottom: 20, right: 0))

        collectionSection = section
        return section
    }

}
