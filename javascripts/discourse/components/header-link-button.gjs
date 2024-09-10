import Component from "@glimmer/component";
import DButton from "discourse/components/d-button";

export default class HeaderLinkButton extends Component {
  <template>
    <DButton
      @href="https://coop.pavilion.tech"
      @translatedLabel="Looking for Pavilion?"
      @translatedTitle="Go to Pavilion's forum"
      id="header-link-button"
      class="btn-small header-link-button"
    />
  </template>
}