//
//  ViewController.swift
//  CompositeLayout
//
//  Created by Dambert Louis Munoz Santillana on 8/03/22.
//

import UIKit

class ViewController: UIViewController {
    typealias Datasource = UICollectionViewDiffableDataSource<Int, Section>
    var datasource: Datasource!
    override func viewDidLoad() {
        super.viewDidLoad()
        setupCollectionView()
    }
//    @IBOutlet var collectionView: UICollectionView! {
//        didSet {
//
//            // Create Collection View Layout
//            collectionView.collectionViewLayout = generateLayout()
//            collectionView.register(SimpleHeaderView.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: SimpleHeaderView.reuseIdentifier)
//            collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "cell")
//        }
//    }

    func setupCollectionView() {
        let myCollectionView: UICollectionView = UICollectionView(frame: self.view.bounds, collectionViewLayout: generateLayout())
        myCollectionView.dataSource = self
        myCollectionView.delegate = self
        myCollectionView.register(SimpleHeaderView.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: SimpleHeaderView.reuseIdentifier)
        myCollectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "cell")
          self.view.addSubview(myCollectionView)
    }

    func generateLayout() -> UICollectionViewLayout {
      let layout = UICollectionViewCompositionalLayout { (sectionIndex: Int,
        layoutEnvironment: NSCollectionLayoutEnvironment)
          -> NSCollectionLayoutSection? in
          let sectionLayoutKind = Section.allCases[sectionIndex]
          return sectionLayoutKind.layoutSection
      }
      return layout
    }


}
extension ViewController: UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {

    func numberOfSections(in collectionView: UICollectionView) -> Int {
        Section.allCases.count
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.bounds.width, height: 200.0)
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 20.0
    }
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        if kind == UICollectionView.elementKindSectionHeader {
               let sectionHeader = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: SimpleHeaderView.reuseIdentifier, for: indexPath) as! SimpleHeaderView
            sectionHeader.configure(with: Section.allCases[indexPath.section].title)
               return sectionHeader
          } else { //No footer in this case but can add option for that
               return UICollectionReusableView()
          }
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return CGSize(width: collectionView.frame.width, height: 40)
    }
}

extension ViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return Section.allCases[section].numberOfItems
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {

        let section = Section.allCases[indexPath.section]
        var text = ""
        switch section {
        case .detail:
            text = Section.Detail.allCases[indexPath.row].rawValue
        case .offer:
            text = Section.Offer.allCases[indexPath.row].rawValue
        case .summary:
            text = Section.Summary.allCases[indexPath.row].rawValue
        case .points:
            text = Section.Points.allCases[indexPath.row].rawValue
        case .reprobate:
            text = Section.Reprobate.allCases[indexPath.row].rawValue
        }
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath)
        cell.backgroundColor = .random.withAlphaComponent(0.5)
        let label = UILabel(frame: CGRect(x: 0, y: 0, width: 100, height: 30))
        label.text = text
        label.textColor = UIColor.white
        cell.addSubview(label)
        return cell
    }

}
extension UIColor {
    static var random: UIColor {
        let r:CGFloat  = .random(in: 0...1)
        let g:CGFloat  = .random(in: 0...1)
        let b:CGFloat  = .random(in: 0...1)
        return UIColor(red: r, green: g, blue: b, alpha: 1)
    }
}
