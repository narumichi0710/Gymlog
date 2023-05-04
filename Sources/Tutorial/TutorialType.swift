//
//  TutorialType.swift
//  
//
//  Created by Narumichi Kubo on 2023/05/04.
//

import Foundation


public enum TutorialType: Int, CaseIterable {
    case begin
    case step_1
    case step_2
    case step_3
    case end
    
    public var title: String {
        switch self {
        case .begin:
            return "チュートリアルを開始する"
        case .step_1:
            return "Welcome"
        case .step_2:
            return "Track and Analyze"
        case .step_3:
            return "Together!"
        case .end:
            return "チュートリアルを終了する"
        }
    }
    
    public var discripion: String {
        switch self {
        case .begin:
            return ""
        case .step_1:
            return "xxはカレンダーで簡単にトレーニングの記録を管理できます。"
        case .step_2:
            return "様々な統計を通じて自身の成長を確認することができます"
        case .step_3:
            return "世界中のxxとともに\nトレーニング経験を共有します。"
        case .end:
            return "チュートリアルを終了する"
        }
    }
    
    public var mainIconName: String {
        switch self {
        case .begin:
            return "info.circle"
        case .step_1:
            return "calendar"
        case .step_2:
            return "chart.bar.xaxis"
        case .step_3:
            return "person.2.square.stack"
        case .end:
            return "checkmark.circle"
        }
    }

    public var subIconName: String {
        switch self {
        case .begin:
            return "play.circle"
        case .step_1:
            return "arrow.right.circle"
        case .step_2:
            return "arrow.right.circle"
        case .step_3:
            return "arrow.right.circle"
        case .end:
            return "stop.circle"
        }
    }
    
    public func onBack() -> TutorialType {
        guard let applyStep = TutorialType(rawValue: self.rawValue - 1) else {
            return self
        }
        return applyStep
    }
    
    public func onForward() -> TutorialType {
        guard let applyStep = TutorialType(rawValue: self.rawValue + 1) else {
            return self
        }
        return applyStep
    }
}
