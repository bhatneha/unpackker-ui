<template>
<div class="container">
    <h4>Your asset have been packed successfully!</h4>
    <b-button id="button" :pressed.sync="downbtn" :disabled="disable" @click="download">Download Here</b-button>
</div>
</template>

<script>
export default {
  name: 'Download',
  data: () => ({
    downbtn: false,
    disable: false
  }),
  methods: {
    download: function () {
      if (this.downbtn === true) {
        window.location.href = process.env.VUE_APP_ROOT_API + `/v1/download?asset=${this.$route.params.packedassetpath}`
      }
      this.disable = true
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
