import UIKit
import Composed
import ComposedUI

final class PeopleSection: ArraySection<String>, CollectionSectionProvider {

//    let title: String

//    init(title: String, elements: [Element]) {
//        self.title = title
//        super.init(elements: elements)
//    }

    var collectionSection: CollectionSection {
        return CollectionSection(section: self, prototype: PersonCollectionCell.fromNib, cellDequeueMethod: .nib, cellConfigurator: { cell, index, section in
            let person = section.element(at: index)
            cell.titleLabel.text = person
        })
    }

}
