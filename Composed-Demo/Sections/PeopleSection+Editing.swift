import UIKit
import Composed
import ComposedUI

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

        cell.insertionHandler = { [weak self] person in
            guard let self = self else { return }
            let index = person.flatMap { self.firstIndex(of: $0) } ?? index
            self.insert(Person(name: Lorem.fullName), at: index + 1)
        }

        cell.deletionHandler = { [weak self] person in
            guard let self = self else { return }
            if self.count == 1 {
                self.parent?.remove(self)
            } else {
                guard let index = person.flatMap({ self.firstIndex(of: $0) }) else { return }
                self.remove(at: index)
            }
        }
    }

}
