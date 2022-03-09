//
//  ViewController.swift
//  CompositeLayout
//
//  Created by Dambert Louis Munoz Santillana on 7/03/22.
//
//
//import UIKit
//
//class ViewController2: UIViewController {
//
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        // Do any additional setup after loading the view.
//    }
//    @IBOutlet var collectionView: UICollectionView! {
//        didSet {
//
//            // Create Collection View Layout
//            collectionView.collectionViewLayout = generateLayout()
//            // Register Episode Collection View Cell
////            let xib = UINib(nibName: EpisodeCollectionViewCell.nibName, bundle: .main)
////            collectionView.regi
////            collectionView.register(xib, forCellWithReuseIdentifier: EpisodeCollectionViewCell.reuseIdentifier)
//            collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "cell")
//        }
//    }
//
//    func advancedLayout() -> NSCollectionLayoutSection {
//
//        let fullPhotoItem = NSCollectionLayoutItem(
//          layoutSize: NSCollectionLayoutSize(
//            widthDimension: .fractionalWidth(1.0),
//            heightDimension: .fractionalWidth(2/3)))
//
//        fullPhotoItem.contentInsets = NSDirectionalEdgeInsets(
//          top: 2,
//          leading: 2,
//          bottom: 2,
//          trailing: 2)
//
//        // Second type: Main with pair
//        // 3
//        let mainItem = NSCollectionLayoutItem(
//          layoutSize: NSCollectionLayoutSize(
//            widthDimension: .fractionalWidth(2/3),
//            heightDimension: .fractionalHeight(1.0)))
//
//        mainItem.contentInsets = NSDirectionalEdgeInsets(
//          top: 2,
//          leading: 2,
//          bottom: 2,
//          trailing: 2)
//
//        // 2
//        let pairItem = NSCollectionLayoutItem(
//          layoutSize: NSCollectionLayoutSize(
//            widthDimension: .fractionalWidth(1.0),
//            heightDimension: .fractionalHeight(0.5)))
//
//        pairItem.contentInsets = NSDirectionalEdgeInsets(
//          top: 2,
//          leading: 2,
//          bottom: 2,
//          trailing: 2)
//
//        let trailingGroup = NSCollectionLayoutGroup.vertical(
//          layoutSize: NSCollectionLayoutSize(
//            widthDimension: .fractionalWidth(1/3),
//            heightDimension: .fractionalHeight(1.0)),
//          subitem: pairItem,
//          count: 2)
//
//        // 1
//        let mainWithPairGroup = NSCollectionLayoutGroup.horizontal(
//          layoutSize: NSCollectionLayoutSize(
//            widthDimension: .fractionalWidth(1.0),
//            heightDimension: .fractionalWidth(4/9)),
//          subitems: [mainItem, trailingGroup])
//
//        // Third type. Triplet
//        let tripletItem = NSCollectionLayoutItem(
//          layoutSize: NSCollectionLayoutSize(
//            widthDimension: .fractionalWidth(1/3),
//            heightDimension: .fractionalHeight(1.0)))
//
//        tripletItem.contentInsets = NSDirectionalEdgeInsets(
//          top: 2,
//          leading: 2,
//          bottom: 2,
//          trailing: 2)
//
//        let tripletGroup = NSCollectionLayoutGroup.horizontal(
//          layoutSize: NSCollectionLayoutSize(
//            widthDimension: .fractionalWidth(1.0),
//            heightDimension: .fractionalWidth(2/9)),
//          subitem: tripletItem,
//          count: 3)
//
//        // Fourth type. Reversed main with pair
//        let mainWithPairReversedGroup = NSCollectionLayoutGroup.horizontal(
//          layoutSize: NSCollectionLayoutSize(
//            widthDimension: .fractionalWidth(1.0),
//            heightDimension: .fractionalWidth(4/9)),
//          subitems: [trailingGroup, mainItem])
//
//        let nestedGroup = NSCollectionLayoutGroup.vertical(
//          layoutSize: NSCollectionLayoutSize(
//            widthDimension: .fractionalWidth(1.0),
//            heightDimension: .fractionalWidth(16/9)),
//          subitems: [
//            fullPhotoItem,
//            mainWithPairGroup,
//            tripletGroup,
//            mainWithPairReversedGroup
//          ]
//        )
//
//        let section = NSCollectionLayoutSection(group: nestedGroup)
//
//        return section
//
////        let layout = UICollectionViewCompositionalLayout(section: section)
////        return layout
//    }
//    func mediumLayout() -> NSCollectionLayoutSection {
//      //1
//      let itemSize = NSCollectionLayoutSize(
//        widthDimension: .fractionalWidth(1.0),
//        heightDimension: .fractionalHeight(1.0))
//      let fullPhotoItem = NSCollectionLayoutItem(layoutSize: itemSize)
//      //2
//        fullPhotoItem.contentInsets = NSDirectionalEdgeInsets(
//            top: 2,
//            leading: 2,
//            bottom: 2,
//            trailing: 2)
//
//      let groupSize = NSCollectionLayoutSize(
//        widthDimension: .fractionalWidth(1.0),
//        heightDimension: .fractionalWidth(2/3))
//      let group = NSCollectionLayoutGroup.horizontal(
//        layoutSize: groupSize,
//        subitem: fullPhotoItem,
//        count: 1)
//      //3
//      let section = NSCollectionLayoutSection(group: group)
//      section.orthogonalScrollingBehavior = .groupPaging
//
//      return section
//
////      let layout = UICollectionViewCompositionalLayout(section: section)
////      return layout
//    }
//
//    private func simpleLayout() -> UICollectionViewLayout {
//        // Define Item Size
//        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .estimated(200.0))
//
//        // Create Item
//        let item = NSCollectionLayoutItem(layoutSize: itemSize)
//
//        // Define Group Size
//        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .estimated(200.0))
//
//        // Create Group
//        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [ item ])
//
//        // Create Section
//        let section = NSCollectionLayoutSection(group: group)
//
//        // Configure Section
//        section.contentInsets = NSDirectionalEdgeInsets(top: 0.0, leading: 20.0, bottom: 0.0, trailing: 20.0)
//
//        return UICollectionViewCompositionalLayout(section: section)
//    }
//
//    func generateLayout() -> UICollectionViewLayout {
//      let layout = UICollectionViewCompositionalLayout { (sectionIndex: Int,
//        layoutEnvironment: NSCollectionLayoutEnvironment)
//          -> NSCollectionLayoutSection? in
//        let sectionLayoutKind = Section.allCases[sectionIndex]
//        switch (sectionLayoutKind) {
//        case .offers: return self.mediumLayout()
//        case .other: return self.advancedLayout()
//        }
//      }
//      return layout
//    }
//
//
//}
//
//extension ViewController {
//    enum Section: CaseIterable {
//        case offers
//        case other
//    }
//}
//extension ViewController: UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
//
//    func numberOfSections(in collectionView: UICollectionView) -> Int {
//        return 2
//    }
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
//        return CGSize(width: collectionView.bounds.width, height: 200.0)
//    }
//
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
//        return 20.0
//    }
//
//}
//
//extension ViewController: UICollectionViewDataSource {
//    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
//        return 10
//    }
//
//    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
//
//        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath)
//        cell.backgroundColor = .random.withAlphaComponent(0.5)
//        let label = UILabel(frame: CGRect(x: 0, y: 0, width: 100, height: 30))
//        label.text = "Kavak"
//        label.textColor = UIColor.white
//        cell.addSubview(label)
//        return cell
//    }
//
//
//}
//extension UIColor {
//    static var random: UIColor {
//        let r:CGFloat  = .random(in: 0...1)
//        let g:CGFloat  = .random(in: 0...1)
//        let b:CGFloat  = .random(in: 0...1)
//        return UIColor(red: r, green: g, blue: b, alpha: 1)
//    }
//}
