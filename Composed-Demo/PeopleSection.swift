import UIKit
import Composed
import ComposedUI

final class PeopleSection: ArraySection<String> {

    let title: String

    init(title: String, elements: [String]) {
        self.title = title
        super.init(elements: elements)
    }

}

extension PeopleSection: TableSectionProvider {

    // update header/footer to take an enum that's either a title or an element rather than a separate initializer

    var tableSection: TableSection {
        return TableSection(section: self, prototype: UITableViewCell(style: .default, reuseIdentifier: "UITableViewCell"), cellDequeueMethod: .class, cellConfigurator: { cell, index, section in
            let person = section.element(at: index)
            cell.textLabel?.text = person
        }, header: title, footer: nil)
    }

}

extension PeopleSection: CollectionSectionProvider {

    var collectionSection: CollectionSection {
        return CollectionSection(section: self, prototype: PersonCollectionCell.fromNib, cellDequeueMethod: .nib, cellConfigurator: { cell, index, section in
            let person = section.element(at: index)
            cell.titleLabel.text = person
        })
    }

}

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
