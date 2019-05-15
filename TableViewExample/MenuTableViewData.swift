import UIKit

/// A specific set of structs for implementing a menu
struct MenuTableViewData: TableViewData {
    let sections: [TableViewSection]

    func prepareForTableView(_ tableView: UITableView) {
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "MenuItem")
    }
}

struct MenuTableViewSection: TableViewSection {
    let header: TableViewHeader
    let height: CGFloat
    let rows: [TableViewRow]
}

struct MenuTableViewHeader: TableViewHeader {
    let title: String
}

struct MenuTableViewRow: TableViewRow {
    let text: String
    var height: CGFloat
    let selected: () -> ()

    func tableViewCell(for tableView: UITableView, indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MenuItem", for: indexPath)
        cell.textLabel?.text = text
        return cell
    }

    func tableViewSelectedRow() {
        selected()
    }
}

/// A function that creates a set of tableview data for driving a menu.
extension MenuTableViewData {
    static func createMenu() -> TableViewData {
        let sections = [
            MenuTableViewSection(header: MenuTableViewHeader(title: "My Account"),
                                 height: 60,
                                 rows: [
                                    MenuTableViewRow(text: "Preferences",
                                                     height: 44,
                                                     selected: { print ("tapped Preferences") }),
                                    MenuTableViewRow(text: "Money",
                                                     height: 44,
                                                     selected: { print ("tapped Money") }),
                                    ]),
            MenuTableViewSection(header: MenuTableViewHeader(title: "Help"),
                                 height: 60,
                                 rows: [
                                    MenuTableViewRow(text: "View FAQ",
                                                     height: 44,
                                                     selected: { print ("tapped View FAQ") }),
                                    MenuTableViewRow(text: "Call Support",
                                                     height: 44,
                                                     selected: { print ("tapped Call Support") }),
                                    ])
        ]

        return MenuTableViewData(sections: sections)
    }
}
