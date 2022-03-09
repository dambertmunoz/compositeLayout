//
//  ViewController+Extension.swift
//  CompositeLayout
//
//  Created by Dambert Louis Munoz Santillana on 8/03/22.
//

import UIKit

extension ViewController {

    enum Section: CaseIterable, Hashable {
        static var allCases: [ViewController.Section] = [.detail(.detail), .offer(.inmediatly), .summary(.documents), .points(.ok), .reprobate(.dimples)]

        case detail(Detail)
        case offer(Offer)
        case summary(Summary)
        case points(Points)
        case reprobate(Reprobate)
    }
}

// SectionLayout
extension ViewController.Section {

    var layoutSection: NSCollectionLayoutSection {
        switch self {
        case .offer:
            return Layout.pageLayout()
        default:
            return Layout.basicLayout()
        }
    }
}
extension ViewController.Section {

    var numberOfItems: Int {
        switch self {
        case .detail:
            return Detail.allCases.count
        case .offer:
            return Offer.allCases.count
        case .summary:
            return Summary.allCases.count
        case .points:
            return Points.allCases.count
        case .reprobate:
            return Reprobate.allCases.count
        }
    }
    var title: String {
        switch self {
        case .detail:
            return "Detalles"
        case .offer:
            return "Oferta"
        case .summary:
            return "Resumen"
        case .points:
            return "Points"
        case .reprobate:
            return "Inspeccion Kavak"
        }
    }
}
extension ViewController.Section {

    enum Detail: String, CaseIterable {
        case detail = "Detalle"
        case inProcess = "En Proceso"
        case offerBefore = "Oferta anterior"
    }
    enum Offer: String, CaseIterable {
        case inmediatly = "Inmediato"
        case tradeIn = "Trade In"
    }
    enum Summary: String, CaseIterable {
        case documents = "Documents"
        case validOffer = "Validar Oferta"
        case investigationTower = "Investigacion Tower"
        case postInspection = "Post - Inspecciones"
    }
    enum Points: String, CaseIterable {
        case ok
        case noOk
        case noApply
        case reprobate
        case dimples
        case repair
    }
    enum Reprobate: String, CaseIterable {
        case dimples = "Dimples"
        case repairs = "Reparaciones"
    }
}
