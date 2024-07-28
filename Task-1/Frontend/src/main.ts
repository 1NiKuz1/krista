import "./assets/main.css";

import { createApp } from "vue";

import App from "./App.vue";
import router from "./router";
import VueButton from "./components/UI/VueButton.vue";
const app = createApp(App);

app.component("VueButton", VueButton);

app.use(router);

app.mount("#app");
