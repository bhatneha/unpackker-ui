import Vue from 'vue'
import App from './App.vue'
import router from './router'
// import store from './store'
import BootstrapVue from 'bootstrap-vue/dist/bootstrap-vue.esm'
import VueProgressBar from 'vue-progressbar'
import 'bootstrap/dist/css/bootstrap.css'
import 'bootstrap-vue/dist/bootstrap-vue.css'
import 'vue2-dropzone/dist/vue2Dropzone.min.css'

Vue.use(BootstrapVue)
Vue.use(VueProgressBar, {
  color: 'rgb(143, 255, 199)',
  failedColor: 'red',
  height: '2px'
})

Vue.config.productionTip = false

new Vue({
  router,
  // store,
  render: h => h(App)
}).$mount('#app')
