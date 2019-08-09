import UIKit
import Composed
import ComposedUI

final class People {
    static var provider: SectionProvider {
        let provider = ComposedSectionProvider()

        for _ in 0..<10 {
            provider.append(PeopleSection(title: "Family", elements: [
                "Anne",
                "Shaps",
                "Anton",
            ]))

            provider.append(PeopleSection(title: "Friends", elements: [
                "Joseph",
                "Francesco",
            ]))
        }

        provider.append(PeopleSection(title: "Family", elements: [
            "Anne",
            "Shaps",
            "Anton",
        ]))

        provider.append(PeopleSection(title: "Friends", elements: [
            "Joseph",
            "Francesco",
        ]))

        provider.append(PeopleSection(title: "Family", elements: [
            "Anne",
            "Shaps",
            "Anton",
        ]))

        provider.append(PeopleSection(title: "Friends", elements: [
            "Joseph",
            "Francesco",
        ]))

        provider.append(PeopleSection(title: "Family", elements: [
            "Anne",
            "Shaps",
            "Anton",
        ]))

        provider.append(PeopleSection(title: "Friends", elements: [
            "Joseph",
            "Francesco",
        ]))

        provider.append(PeopleSection(title: "Family", elements: [
            "Anne",
            "Shaps",
            "Anton",
        ]))

        provider.append(PeopleSection(title: "Friends", elements: [
            "Joseph",
            "Francesco",
        ]))

        provider.append(PeopleSection(title: "Family", elements: [
            "Anne",
            "Shaps",
            "Anton",
        ]))

        provider.append(PeopleSection(title: "Friends", elements: [
            "Joseph",
            "Francesco",
        ]))

        provider.append(PeopleSection(title: "Family", elements: [
            "Anne",
            "Shaps",
            "Anton",
        ]))

        provider.append(PeopleSection(title: "Friends", elements: [
            "Joseph",
            "Francesco",
        ]))

        provider.append(PeopleSection(title: "Family", elements: [
            "Anne",
            "Shaps",
            "Anton",
        ]))

        provider.append(PeopleSection(title: "Friends", elements: [
            "Joseph",
            "Francesco",
        ]))

        provider.append(PeopleSection(title: "Family", elements: [
            "Anne",
            "Shaps",
            "Anton",
        ]))

        provider.append(PeopleSection(title: "Friends", elements: [
            "Joseph",
            "Francesco",
        ]))

        provider.append(PeopleSection(title: "Family", elements: [
            "Anne",
            "Shaps",
            "Anton",
        ]))

        provider.append(PeopleSection(title: "Friends", elements: [
            "Joseph",
            "Francesco",
        ]))

        provider.append(PeopleSection(title: "Family", elements: [
            "Anne",
            "Shaps",
            "Anton",
        ]))

        provider.append(PeopleSection(title: "Friends", elements: [
            "Joseph",
            "Francesco",
        ]))

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

    init(title: String, elements: [String]) {
        self.title = title
        super.init(elements: elements)
    }

}

extension PeopleSection: TableSectionProvider {

    func section(with environment: Environment) -> TableSection {
        return TableSection(section: self,
                            cellDequeueMethod: .storyboard(UITableViewCell.self),
                            cellReuseIdentifier: "Cell",
                            cellConfigurator: { cell, index, section, _ in
                                let person = section.element(at: index)
                                cell.textLabel?.text = person
                                cell.detailTextLabel?.text = "12"
        }, header: .title(title))
    }

}

extension PeopleSection: CollectionSectionProvider {

    func section(with environment: Environment) -> CollectionSection {
        let metrics = CollectionSectionMetrics(sectionInsets: .init(top: 20, left: 0, bottom: 20, right: 0),
                                               minimumInteritemSpacing: 0, minimumLineSpacing: 0)

        let strategy = ColumnCollectionSizingStrategy(columnCount: 1, sizingMode: .automatic(isUniform: false), metrics: metrics)
        
        return CollectionSectionFlowLayout(section: self,
                                           sizingStrategy: strategy,
                                           cellDequeueMethod: .nib(PersonCollectionCell.self),
                                           cellReuseIdentifier: "PersonCell",
                                           cellConfigurator: { cell, index, section, context in
                                            let person = section.element(at: index)
                                            cell.titleLabel.text = person
        })
    }

}
