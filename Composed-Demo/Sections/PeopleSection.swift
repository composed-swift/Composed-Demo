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

final class PeopleSection: ArraySection<Person> {

    let prototypeCell = PersonCollectionCell.fromNib
    let prototypeHeader = PersonCollectionHeader.fromNib

    private(set) weak var parent: PeopleComposedSectionProvider?

    convenience init(parent: PeopleComposedSectionProvider, elements: [Person]) {
        self.init(elements)
        self.parent = parent
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
