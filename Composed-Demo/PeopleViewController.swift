import UIKit
import Composed
import ComposedUI

final class PeopleSection: ArraySection<String>, CollectionUIConfigurationProvider {

    var collectionUIConfiguration: CollectionUIConfiguration {
        return SectionCollectionUIConfiguration(section: self, prototype: PersonCollectionCell.fromNib, cellDequeueMethod: .nib, cellConfigurator: { cell, index, section in
            let person = section.element(at: index)
            cell.titleLabel.text = person
        })
    }

}

final class PeopleTableViewController: UITableViewController {

    private lazy var dataSource: ComposedSectionProvider = {
        let provider = ComposedSectionProvider()
        provider.append(family)
        provider.append(friends)
        return provider
    }()

    private lazy var family: PeopleSection = {
        return PeopleSection(elements: [
            "Anne",
            "Shaps",
            "Anton",
        ])
    }()

    private lazy var friends: PeopleSection = {
        return PeopleSection(elements: [
            "Joseph",
            "Francesco",
        ])
    }()

    override func numberOfSections(in tableView: UITableView) -> Int {
        return dataSource.numberOfSections
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataSource.numberOfElements(in: section)
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let person = indexPath.section == 0 ? family.element(at: indexPath.item) : friends.element(at: indexPath.item)
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        cell.textLabel?.text = person
        return cell
    }

    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        switch section {
        case 0: return "Family"
        case 1: return "Friends"
        default: return nil
        }
    }

    override func tableView(_ tableView: UITableView, titleForFooterInSection section: Int) -> String? {
        return "\(dataSource.sections[section].numberOfElements) People"
    }

}
