import Vue from 'vue'
import VueRouter from 'vue-router'
import login from '@/components/login'
import signup from '@/components/signup'
import home from '@/components/home'
import packker from '@/components/packker'
import unpackker from '@/components/unpackker'
import download from '@/components/download'

Vue.use(VueRouter)

const routes = [
  {
    path: '/',
    name: 'Home',
    component: home
  },
  {
    path: '/login',
    name: 'Login',
    component: login
  },
  {
    path: '/signup',
    name: 'SignUp',
    component: signup
  },
  {
    path: '/packker',
    name: 'Packker',
    component: packker
  },
  {
    path: '/unpackker',
    name: 'Unpackker',
    component: unpackker
  },
  {
    path: '/download',
    name: 'Download',
    component: download
  }
]

const router = new VueRouter({
  mode: 'history',
  base: process.env.BASE_URL,
  routes
})

export default router
