import Foundation
import Composed

final class People {
    static var provider: SectionProvider {
        let provider = ComposedSectionProvider()

        var section = PeopleSection(title: "Other", elements: [])
        provider.append(section)

        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            section.append(contentsOf: ["one", "two", "three"])

            DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                section.removeLast(3)
            }
        }

//        for _ in 0..<10 {
//            provider.append(PeopleSection(title: "Family", elements: [
//                "Anne",
//                "Shaps",
//                "Anton",
//            ]))
//
//            provider.append(PeopleSection(title: "Friends", elements: [
//                "Joseph",
//                "Francesco",
//            ]))
//        }
//
//        provider.append(PeopleSection(title: "Family", elements: [
//            "Anne",
//            "Shaps",
//            "Anton",
//        ]))
//
//        provider.append(PeopleSection(title: "Friends", elements: [
//            "Joseph",
//            "Francesco",
//        ]))
//
//        provider.append(PeopleSection(title: "Family", elements: [
//            "Anne",
//            "Shaps",
//            "Anton",
//        ]))
//
//        provider.append(PeopleSection(title: "Friends", elements: [
//            "Joseph",
//            "Francesco",
//        ]))
//
//        provider.append(PeopleSection(title: "Family", elements: [
//            "Anne",
//            "Shaps",
//            "Anton",
//        ]))
//
//        provider.append(PeopleSection(title: "Friends", elements: [
//            "Joseph",
//            "Francesco",
//        ]))
//
//        provider.append(PeopleSection(title: "Family", elements: [
//            "Anne",
//            "Shaps",
//            "Anton",
//        ]))
//
//        provider.append(PeopleSection(title: "Friends", elements: [
//            "Joseph",
//            "Francesco",
//        ]))
//
//        provider.append(PeopleSection(title: "Family", elements: [
//            "Anne",
//            "Shaps",
//            "Anton",
//        ]))
//
//        provider.append(PeopleSection(title: "Friends", elements: [
//            "Joseph",
//            "Francesco",
//        ]))
//
//        provider.append(PeopleSection(title: "Family", elements: [
//            "Anne",
//            "Shaps",
//            "Anton",
//        ]))
//
//        provider.append(PeopleSection(title: "Friends", elements: [
//            "Joseph",
//            "Francesco",
//        ]))
//
//        provider.append(PeopleSection(title: "Family", elements: [
//            "Anne",
//            "Shaps",
//            "Anton",
//        ]))
//
//        provider.append(PeopleSection(title: "Friends", elements: [
//            "Joseph",
//            "Francesco",
//        ]))
//
//        provider.append(PeopleSection(title: "Family", elements: [
//            "Anne",
//            "Shaps",
//            "Anton",
//        ]))
//
//        provider.append(PeopleSection(title: "Friends", elements: [
//            "Joseph",
//            "Francesco",
//        ]))
//
//        provider.append(PeopleSection(title: "Family", elements: [
//            "Anne",
//            "Shaps",
//            "Anton",
//        ]))
//
//        provider.append(PeopleSection(title: "Friends", elements: [
//            "Joseph",
//            "Francesco",
//        ]))
//
//        provider.append(PeopleSection(title: "Family", elements: [
//            "Anne",
//            "Shaps",
//            "Anton",
//        ]))
//
//        provider.append(PeopleSection(title: "Friends", elements: [
//            "Joseph",
//            "Francesco",
//        ]))
//
//        provider.append(PeopleSection(title: "Family", elements: [
//            "Anne",
//            "Shaps",
//            "Anton",
//        ]))
//
//        provider.append(PeopleSection(title: "Friends", elements: [
//            "Joseph",
//            "Francesco",
//        ]))

        return provider
    }
}
