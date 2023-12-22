import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
  static targets = ["input", "submit"];

  connect() {
  }
  
  enableSubmit() {
    const inputs = this.inputTargets;
    const submitButton = this.submitTarget;
    let isValid = true;

    inputs.forEach(input => {
      if (input.value === "" || input.value === null) {
        isValid = false;
      }
    });

    submitButton.disabled = !isValid;
  }
}