import Component from "@glimmer/component";
import DButton from "discourse/components/d-button";
import themeSetting from "discourse/helpers/theme-setting";
import { iconNode } from "discourse-common/lib/icon-library";
import { htmlSafe } from "@ember/template";
import DiscourseURL from "discourse/lib/url";
import { on } from "@ember/modifier";
import { service } from "@ember/service";
import { action } from "@ember/object";

export default class HeaderLinkButton extends Component {
  @service site;

  get target() {
    if (settings.new_tab) {
      return '_blank';
    }
    return '';
  }

  get icon() {
    if (settings.custom_icon) {
      return htmlSafe(`<img src=${settings.custom_icon} class="d-icon" />`);
    } else if (settings.icon) {
      return iconNode(settings.icon);
    }
  }

  get showLabel() {
    return !this.site.mobileView || settings.show_label_on_mobile;
  }

  get label() {
    if (this.showLabel && settings.label) {
      return htmlSafe(`<span class="d-button-label">${settings.label}</span>`)
    }
  }

  @action
  click() {
    if (settings.url) {
      DiscourseURL.routeTo(settings.url);
    }
  }

  <template>
    <a
      id="header-link-button"
      href={{settings.url}}
      target={{this.target}}
      class="btn"
      role="button"
      title={{settings.title}}>
      {{this.icon}}
      {{this.label}}
    </a>
  </template>
}