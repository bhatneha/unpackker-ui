<template>
<div class="container">
    <h4>Your asset have been packed successfully!</h4>
    <b-button id="button" :pressed.sync="myToggle" :disabled="disable" @click="download">Download Here</b-button>
</div>
</template>

<script>
// import axios from 'axios'

export default {
  name: 'Download',
  data: () => ({
    myToggle: false,
    disable: false
  }),
  methods: {
    download: function () {
      if (this.myToggle === true) {
        window.location.href = `http://localhost:8080/v1/download?asset=${this.$route.params.packedassetpath}`
      }
      this.disable = true

      // const url = `http://localhost:8080/v1/download?asset=${route.params.packedassetpath}`
      // const options = {
      //     method: 'GET'
      // }
      // axios(url,options)
      // .then((response)=> {
      // if (response.status === 200) {
      //     this.$router.push({ name: 'Packker'})
      // }
      // })
      // .catch((err) => {
      //     console.log(err)
      // })
    }
  }
}
</script>

<style scoped>
.container{
    text-align: center;
}
#button{
    background-color: black;
    padding: 20px 30px 20px 30px;
    font-size: 25px;
}
</style>
