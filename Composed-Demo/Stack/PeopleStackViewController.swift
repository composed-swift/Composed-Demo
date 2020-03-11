import UIKit
import Composed
import ComposedUI

final class PeopleStackViewController: PeopleViewController {

    private var composedView: ComposedView {
        return view as! ComposedView
    }

    private var coordinator: StackCoordinator?

    override func viewDidLoad() {
        super.viewDidLoad()
        coordinator = StackCoordinator(composedView: composedView, sectionProvider: provider)
        composedView.contentInsets.bottom = 20
    }

    private var isFirstRun: Bool = true
    override func appendSection() {
        insertSection(at: composedView.sections.count, with: isFirstRun ? .none : .fade)
        isFirstRun = false
    }

    private func insertSection(at index: Int, with animation: ComposedStackView.Animation) {
        let section = ComposedSectionView()
        section.separatorInsets = UIEdgeInsets(top: 0, left: 20, bottom: 0, right: 0)

        func insert(at index: Int) {
            let view = PersonStackCell(frame: .zero)
            view.apply(person: Person(name: Lorem.fullName))

            view.personView.insertionHandler = { _ in
                guard let index = section.visibleCells.firstIndex(of: view) else { return }
                insert(at: index + 1)
            }

            view.personView.deletionHandler = { _ in
                section.removeItemView(view)
            }

            section.insertItemView(view, at: index)
        }

        // initial items
        for _ in 0..<((1..<10).randomElement() ?? 1) {
            insert(at: section.visibleCells.count)
        }

        // section
        composedView.insertSection(section, at: index, with: animation)
    }

    override func removeSection() {
        composedView.sections.last.flatMap { composedView.removeSection($0) }
    }

}
