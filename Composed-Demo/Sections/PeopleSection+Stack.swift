import UIKit
import Composed
import ComposedUI

extension PeopleSection: StackSectionProvider {

    func section(with traitCollection: UITraitCollection) -> StackSection {
        let cell = StackCellElement(section: self, loadingMethod: .fromClass(PersonStackCell.self)) { cell, index, section in
            cell.apply(person: section.element(at: index))
            section.prepare(cell: cell.personView, at: index)
        }

        return StackSection(section: self, cell: cell)
    }

}
