import Foundation
import Composed

final class People {
    static var provider: SectionProvider {
        let provider = ComposedSectionProvider()

        for _ in 0..<10 {
            provider.append(PeopleSection(title: "Family", elements: [
                "Anne",
                "Shaps",
                "Anton",
            ]))

            provider.append(PeopleSection(title: "Friends", elements: [
                "Joseph",
                "Francesco",
            ]))
        }

        provider.append(PeopleSection(title: "Family", elements: [
            "Anne",
            "Shaps",
            "Anton",
        ]))

        provider.append(PeopleSection(title: "Friends", elements: [
            "Joseph",
            "Francesco",
        ]))

        provider.append(PeopleSection(title: "Family", elements: [
            "Anne",
            "Shaps",
            "Anton",
        ]))

        provider.append(PeopleSection(title: "Friends", elements: [
            "Joseph",
            "Francesco",
        ]))

        provider.append(PeopleSection(title: "Family", elements: [
            "Anne",
            "Shaps",
            "Anton",
        ]))

        provider.append(PeopleSection(title: "Friends", elements: [
            "Joseph",
            "Francesco",
        ]))

        provider.append(PeopleSection(title: "Family", elements: [
            "Anne",
            "Shaps",
            "Anton",
        ]))

        provider.append(PeopleSection(title: "Friends", elements: [
            "Joseph",
            "Francesco",
        ]))

        provider.append(PeopleSection(title: "Family", elements: [
            "Anne",
            "Shaps",
            "Anton",
        ]))

        provider.append(PeopleSection(title: "Friends", elements: [
            "Joseph",
            "Francesco",
        ]))

        provider.append(PeopleSection(title: "Family", elements: [
            "Anne",
            "Shaps",
            "Anton",
        ]))

        provider.append(PeopleSection(title: "Friends", elements: [
            "Joseph",
            "Francesco",
        ]))

        provider.append(PeopleSection(title: "Family", elements: [
            "Anne",
            "Shaps",
            "Anton",
        ]))

        provider.append(PeopleSection(title: "Friends", elements: [
            "Joseph",
            "Francesco",
        ]))

        provider.append(PeopleSection(title: "Family", elements: [
            "Anne",
            "Shaps",
            "Anton",
        ]))

        provider.append(PeopleSection(title: "Friends", elements: [
            "Joseph",
            "Francesco",
        ]))

        provider.append(PeopleSection(title: "Family", elements: [
            "Anne",
            "Shaps",
            "Anton",
        ]))

        provider.append(PeopleSection(title: "Friends", elements: [
            "Joseph",
            "Francesco",
        ]))

        provider.append(PeopleSection(title: "Family", elements: [
            "Anne",
            "Shaps",
            "Anton",
        ]))

        provider.append(PeopleSection(title: "Friends", elements: [
            "Joseph",
            "Francesco",
        ]))

        provider.append(PeopleSection(title: "Family", elements: [
            "Anne",
            "Shaps",
            "Anton",
        ]))

        provider.append(PeopleSection(title: "Friends", elements: [
            "Joseph",
            "Francesco",
        ]))

        return provider
    }
}
