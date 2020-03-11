import UIKit
import ComposedUI

final class PersonStackCell: ComposedViewCell {

    let personView = PersonCollectionCell.fromNib

    override init(frame: CGRect) {
        super.init(frame: frame)
        prepare()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        prepare()
    }

    func apply(person: Person) {
        personView.titleLabel.text = person.name
    }

    private func prepare() {
        personView.separatorView.isHidden = true
        personView.translatesAutoresizingMaskIntoConstraints = false
        addSubview(personView)

        NSLayoutConstraint.activate([
            personView.topAnchor.constraint(equalTo: topAnchor),
            personView.leadingAnchor.constraint(equalTo: leadingAnchor),
            personView.trailingAnchor.constraint(equalTo: trailingAnchor),
            personView.bottomAnchor.constraint(equalTo: bottomAnchor),
        ])
    }

}
