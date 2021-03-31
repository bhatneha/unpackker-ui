<template>
  <div id="app" class="main-container">
    <Navigation/>
    <div id="body" class="container">
    <router-view/>
    <vue-progress-bar></vue-progress-bar>
    </div>
    <Footer/>
  </div>
</template>

<script>
import navigation from './components/navigation'
import footer from './components/footer'

export default {
  name: 'app',
  components: {
    Navigation: navigation,
    Footer: footer
  }
}
</script>

<style>
#app {
  font-family: Avenir, Helvetica, Arial, sans-serif;
  -webkit-font-smoothing: antialiased;
  -moz-osx-font-smoothing: grayscale;
}
.main-container {
   min-height: 100vh;
   overflow: hidden;
   display: block;
   position: relative;
   padding-bottom: 100px;
}
.container{
  padding-top: 100px;
}
</style>
