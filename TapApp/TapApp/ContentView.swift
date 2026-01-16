import SwiftUI
import Combine

struct ContentView: View {

    enum Difficulity {
        case easy
        case medium
        case boss
    }

    let possibleOutcome = ["apple", "dog", "egg"]

    @State private var index = 0
    @State private var difficulityLevel: Difficulity = .easy

  
    @State private var timer = Timer.publish(every: 2, on: .main, in: .common).autoconnect()

    private func interval(for level: Difficulity) -> TimeInterval {
        switch level {
        case .easy: return 2
        case .medium: return 1
        case .boss: return 0.3
        }
    }

    private func restartTimer() {
        timer = Timer.publish(
            every: interval(for: difficulityLevel),
            on: .main,
            in: .common
        ).autoconnect()
    }

    var body: some View {
        VStack(spacing: 20) {
            Menu("Difficulity") {
                Button("Easy") {
                    difficulityLevel = .easy
                    restartTimer()
                }
                Button("Medium") {
                    difficulityLevel = .medium
                    restartTimer()
                }
                Button("Boss") {
                    difficulityLevel = .boss
                    restartTimer()
                }
            }

            Text("Current: \(String(describing: difficulityLevel))")
                .font(.caption)

            Image(possibleOutcome[index])
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(height: 200)
        }
        .onReceive(timer) { _ in
            withAnimation {
                index = (index + 1) % possibleOutcome.count
            }
        }
        .onAppear {
            restartTimer()
        }
    }
}

#Preview {
    ContentView()
}
