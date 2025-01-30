import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["destination"]
  static values = {
    offset: { type: Number, default: 0 }
  }

  scrollTo(event) {
    event.preventDefault()
    const href = event.currentTarget.getAttribute('href')
    const element = document.querySelector(href)

    if (element) {
      const headerOffset = this.offsetValue
      const elementPosition = element.getBoundingClientRect().top
      const offsetPosition = elementPosition + window.pageYOffset - headerOffset

      window.scrollTo({
        top: offsetPosition,
        behavior: "smooth"
      })
    }
  }
}
