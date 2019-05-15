import UIKit

/// General-purpose stuff for table view contents. This is all that any
/// tableview datasource / delegate needs to know about.

protocol TableViewData {
    var sections: [TableViewSection] { get }
    func prepareForTableView(_ tableView: UITableView)
}

protocol TableViewSection {
    var header: TableViewHeader { get }
    var height: CGFloat { get }
    var rows: [TableViewRow] { get }
}

protocol TableViewHeader {
    var title: String { get }
}

protocol TableViewRow {
    var height: CGFloat { get }
    func tableViewCell(for tableView: UITableView, indexPath: IndexPath) -> UITableViewCell
    func tableViewSelectedRow()
}

