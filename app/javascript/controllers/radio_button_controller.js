import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
  static targets = ["radio", "button"];

  enableButton() {
    this.buttonTarget.disabled = false;
  }
}