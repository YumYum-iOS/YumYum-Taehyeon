//
//  CalendarViewController.swift
//  YumYum-Taehyeon
//
//  Created by taehy.k on 2021/06/14.
//

import UIKit

class CalendarViewController: BaseViewController {
    
    // MARK: - Properties
    let now = Date() // 현재 날짜
    let cal = Calendar.current // 현재 달력 가져오기
    let dateFormatter = DateFormatter() // 날짜 형식 변환기
    var components = DateComponents() // -> 특정날짜 생성기
    
    var weeks: [String] = [
        "S", "M", "T", "W", "T", "F", "S"
    ]
    var days: [String] = []
    var daysCountInMonth = 0 // 해당 월이 며칠까지 있는지
    var weekdayAdding = 0 // 시작일

    // MARK: - IBOutlets
    @IBOutlet weak var monthLabel: UILabel!
    @IBOutlet weak var yearLabel: UILabel!
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var weekdayCollectionView: UICollectionView!
    
    // MARK: - Life Cycles
    override func viewDidLoad() {
        super.viewDidLoad()
        initView()
    }
    
    private func initView() {
        initCollection()
        
        monthLabel.textColor = .mobster
        monthLabel.font = UIFont.systemFont(ofSize: 24, weight: .bold)
        yearLabel.textColor = .amethystSmoke
        
        dateFormatter.dateFormat = "M월"
        // components = DateComponents -> 특정 날짜 생성기
        // 2021년 6월 1일 생성
        // 년도도 반드시 지정해줘야 함
        components.year = cal.component(.year, from: now)
        components.month = cal.component(.month, from: now)
        components.day = 1
        self.calculation()
    }
    
    private func initCollection() {
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(UINib(nibName: CalendarCVC.identifier,
                                      bundle: nil),
                                forCellWithReuseIdentifier: CalendarCVC.identifier)
        
        weekdayCollectionView.delegate = self
        weekdayCollectionView.dataSource = self
        weekdayCollectionView.register(UINib(nibName: CalendarCVC.identifier,
                                      bundle: nil),
                                forCellWithReuseIdentifier: CalendarCVC.identifier)
    }
    
    // MARK: - IBActions
    
    @IBAction func previousButtonClicked(_ sender: Any) {
        components.month = components.month! - 1
        self.calculation()
        self.collectionView.reloadData()
    }
    
    @IBAction func nextButtonClicked(_ sender: Any) {
        components.month = components.month! + 1
        self.calculation()
        self.collectionView.reloadData()
    }
}

extension CalendarViewController {
    private func calculation() {
        let firstDayOfMonth = cal.date(from: components)
        let firstWeekday = cal.component(.weekday,
                                         from: firstDayOfMonth!)
        daysCountInMonth = cal.range(of: .day,
                                     in: .month,
                                     for: firstDayOfMonth!)!.count
        
        
        weekdayAdding = 2 - firstWeekday
        
        self.monthLabel.text = dateFormatter.string(from: firstDayOfMonth!)
        
        dateFormatter.dateFormat = "YYYY"
        
        self.yearLabel.text = dateFormatter.string(from: firstDayOfMonth!)
        
        dateFormatter.dateFormat = "M월"
        
        self.days.removeAll()
        
        for day in weekdayAdding...daysCountInMonth {
            if day < 1 {
                self.days.append("")
            } else {
                self.days.append(String(day))
            }
        }
    }
}

extension CalendarViewController: UICollectionViewDelegate {
    
}

extension CalendarViewController: UICollectionViewDataSource {

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        if collectionView == weekdayCollectionView {
            return 7
        } else {
            return days.count
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    
        
        switch collectionView {
        case weekdayCollectionView:
            let cell = weekdayCollectionView.dequeueReusableCell(withReuseIdentifier: CalendarCVC.identifier, for: indexPath) as! CalendarCVC
            
            cell.dataLabel.text = weeks[indexPath.row]
            
            cell.dataLabel.font = UIFont.systemFont(ofSize: 12)
            cell.dataLabel.textColor = .darkGray
            
            return cell
        default:
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CalendarCVC.identifier,
                                                                for: indexPath) as? CalendarCVC else { return UICollectionViewCell() }
            
            cell.dataLabel.text = days[indexPath.row]
            cell.contentView.backgroundColor = .clear
            cell.emptyView.backgroundColor = .clear
            cell.contentView.layer.cornerRadius = cell.frame.height / 2
            
            
            let a = Array<Int>(7...31)
            
            if a.contains(indexPath.row) {
                if indexPath.row % 3 == 0 {
                    cell.contentView.backgroundColor = .amethystSmoke
                } else if indexPath.row % 4 == 0 {
                    cell.contentView.backgroundColor = .mobster
                }
            }

            if indexPath.row % 7 == 0 {
                cell.dataLabel.textColor = .red
            } else {
                cell.dataLabel.textColor = .black
            }
            
            return cell
        }
    }
}

extension CalendarViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let boundSize = UIScreen.main.bounds.size.width
        let cellSize = boundSize / 9
        
        switch collectionView {
        case weekdayCollectionView:
            return CGSize(width: cellSize, height: weekdayCollectionView.frame.height)
        default:
            return CGSize(width: cellSize, height: cellSize)
        }
        
        
        
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 10)
    }
}

