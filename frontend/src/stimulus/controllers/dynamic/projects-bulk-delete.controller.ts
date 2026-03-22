import { Controller } from '@hotwired/stimulus';

export default class ProjectsBulkDeleteController extends Controller<HTMLFormElement> {
  static values = {
    noSelectionMessage: String,
    confirmMessage: String,
  };

  declare noSelectionMessageValue: string;
  declare confirmMessageValue: string;

  validateSubmit(event: SubmitEvent): void {
    if (!this.hasSelection()) {
      event.preventDefault();
      window.alert(this.noSelectionMessageValue);
      return;
    }

    if (!window.confirm(this.confirmMessageValue)) {
      event.preventDefault();
    }
  }

  private hasSelection(): boolean {
    return this.element.querySelector('input[name="project_ids[]"]:checked') !== null;
  }
}
