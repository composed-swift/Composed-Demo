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

extension PeopleSection: StackSectionAppearanceHandler {

    func separatorInsets(suggested: UIEdgeInsets, traitCollection: UITraitCollection) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 20, bottom: 0, right: 0)
    }

}
