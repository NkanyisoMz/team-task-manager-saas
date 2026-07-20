import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="flash"
export default class extends Controller {
  static targets = ["message"]

  connect() {

    if (!this.hasMessageTarget) return

    setTimeout(() => {
      this.messageTarget.classList.add("opacity-0")

      setTimeout(() => {
        this.messageTarget.remove()
      }, 500)

    }, 5000)

  }
}
