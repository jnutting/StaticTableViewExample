import UIKit

class ViewController: UIViewController {

    @IBOutlet var tableView: UITableView!
    var tableViewData: TableViewData!

    override func viewDidLoad() {
        super.viewDidLoad()
        tableViewData.prepareForTableView(tableView)
    }
}

/// None of the following methods know anything about the specific
/// table view they may be responding to. These are completely
/// "generic" (not in the Swift sense, but in the sense of being
/// general-purpose)

extension ViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return tableViewData.sections.count
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tableViewData.sections[section].rows.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return tableViewData.sections[indexPath.section].rows[indexPath.row].tableViewCell(for: tableView, indexPath: indexPath)
    }

    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return tableViewData.sections[section].header.title
    }
}

extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return tableViewData.sections[section].height
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return tableViewData.sections[indexPath.section].rows[indexPath.row].height
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableViewData.sections[indexPath.section].rows[indexPath.row].tableViewSelectedRow()
    }
}
