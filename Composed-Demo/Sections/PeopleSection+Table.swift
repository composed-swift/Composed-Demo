import UIKit
import Photos
import Composed
import ComposedUI
import ComposedMediaUI

extension PeopleSection: TableSectionProvider {

    func section(with traitCollection: UITraitCollection) -> TableSection {
        let header = TableElement(section: self, dequeueMethod: .fromNib(PersonTableHeader.self)) { view, _, section in
            section.prepare(header: view)
        }

        let cell = TableElement(section: self, dequeueMethod: .fromStoryboard(PersonTableCell.self), reuseIdentifier: "Cell") { cell, index, section in
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

extension PeopleSection: TableSelectionHandler {

    func didSelect(at index: Int, cell: UITableViewCell) {
        let media = MediaViewController()
        media.pickerDelegate = self

        let nav = UINavigationController(rootViewController: media)
        nav.navigationBar.tintColor = .systemRed
        nav.toolbar.tintColor = .systemRed
        controller?.present(nav, animated: true, completion: nil)
        deselect(index: index)
    }

}
