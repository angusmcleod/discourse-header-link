import { apiInitializer } from "discourse/lib/api";
import HeaderLinkButton from "../components/header-link-button";

export default apiInitializer("1.15.0", (api) => {
  api.renderInOutlet("before-header-panel", HeaderLinkButton);
});