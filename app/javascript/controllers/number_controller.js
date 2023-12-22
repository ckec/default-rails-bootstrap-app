import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
  static targets = ["box"];

  connect() {
    setTimeout(() => {
      this.boxTarget.removeAttribute('hidden');
      this.boxTarget.classList.add('fade-in');
    }, 3000);
  }

  close() {
    this.boxTarget.classList.add('close');
    setTimeout(() => {
      this.boxTarget.setAttribute('hidden', '');
    }, 500);
  }
}