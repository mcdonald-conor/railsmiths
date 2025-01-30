import { Controller } from "@hotwired/stimulus"
import confetti from "canvas-confetti"

export default class extends Controller {
  static targets = ["button"]

  connect() {
    this.myConfetti = confetti.create(null, {
      resize: true,
      useWorker: true
    })
  }

  disconnect() {
    if (this.myConfetti) {
      this.myConfetti.reset()
    }
  }

  fire() {
    const end = Date.now() + (2 * 1000)
    const colors = ['#1d4ed8', '#2563eb', '#3b82f6', '#60a5fa', '#93c5fd']

    const frame = () => {
      this.myConfetti({
        particleCount: 3,
        angle: 60,
        spread: 55,
        origin: { x: 0 },
        colors: colors
      })
      this.myConfetti({
        particleCount: 3,
        angle: 120,
        spread: 55,
        origin: { x: 1 },
        colors: colors
      })

      if (Date.now() < end) {
        requestAnimationFrame(frame)
      }
    }

    frame()
  }
}
