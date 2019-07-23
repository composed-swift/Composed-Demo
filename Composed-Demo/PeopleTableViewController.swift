import UIKit
import Composed
import ComposedUI

final class PeopleTableViewController: UITableViewController {

//    private lazy var coordinator: CollectionCoordinator = {
//        return CollectionCoordinator(collectionView: collectionView, sectionProvider: <#T##SectionProvider#>)
//    }()

    private lazy var sectionProvider: ComposedSectionProvider = {
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
        return sectionProvider.numberOfSections
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return sectionProvider.numberOfElements(in: section)
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
        return "\(sectionProvider.sections[section].numberOfElements) People"
    }

}
