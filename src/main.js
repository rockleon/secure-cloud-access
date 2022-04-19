import Vue from "vue"
import App from "./App.vue"
import store from "./store"
import vuetify from './plugins/vuetify'
import router from './router'
import drizzleVuePlugin from "@drizzle/vue-plugin"
import drizzleOptions from "./drizzleOptions"

Vue.config.productionTip = false
Vue.use(drizzleVuePlugin, { store, drizzleOptions })

new Vue({
  store,
  vuetify,
  router,
  render: h => h(App)
}).$mount("#app")