<template>
    <div>
        <b-card class="shadow-sm p-3 mb-5 bg-white rounded">
            <b-card-header header-bg-variant="transparent" header-tag="h4" class="text-center">Packker</b-card-header>
            <vue-dropzone ref="myVueDropzone" @vdropzone-complete="afterComplete" id="customdropzone" :options="dropzoneOptions" :useCustomSlot="true" :duplicateCheck="true" @vdropzone-duplicate-file="duplicatecheck">
              Drop your asset here or click to upload !</vue-dropzone>
            <b-alert variant="danger" dismissible :show="duplicate.dups" @dismissed="duplicate.dups=false" id="alert"> {{ this.duplicate.dup }} </b-alert>
            <b-alert variant="success" dismissible :show="alertprops.updatesuccess" @dismissed="alertprops.updatesuccess=false" id="alert">{{ this.alertprops.successmessage }}</b-alert>
            <b-alert variant="success" dismissible :show="alertprops.updatefail" @dismissed="alertprops.updatefail=false" id="alert">{{ this.alertprops.failuremessage }}</b-alert>
            <b-alert variant="danger" dismissible :show="deletealertprops.delete" @dismissed="deletealertprops.delete=false" id="alert"> {{ this.deletealertprops.del}}</b-alert>
            <div class="text-center" id="butn">
              <b-button id="btn1" @click="removeThisFile">Delete</b-button>
              <b-button id="btn" @click="pack">Pack</b-button>
            </div>
        </b-card>
    </div>
</template>

<script>
import vue2Dropzone from 'vue2-dropzone'
import axios from 'axios'

export default {
  name: 'Packker',
  components: {
    vueDropzone: vue2Dropzone
  },
  data: () => ({
    duplicate: {
      dups: false,
      dup: ''
    },
    resp: {},
    packresp: null,
    alertprops: {
      updatesuccess: false,
      updatefail: false,
      successmessage: '',
      failuremessage: ''
    },
    deletealertprops: {
      delete: false,
      del: ''
    },
    dropzoneOptions: {
      url: 'http://localhost:8080/v1/upload',
      maxFilesize: 30,
      addRemoveLinks: false
    }
  }),
  methods: {
    duplicatecheck (file) {
      this.duplicate.dups = true
      this.duplicate.dup = 'Oops! Packing multiple assets is not supported'
    },
    afterComplete (response) {
      this.resp = JSON.parse(response.xhr.response)
    },
    pack: function () {
      const url = 'http://localhost:8080/v1/packker'
      const options = {
        method: 'POST',
        data: JSON.stringify({
          assetpath: this.resp.assetpath,
          name: this.resp.name,
          assetversion: this.resp.assetversion
        })
      }
      axios(url, options)
        .then((response) => {
          if (response.status === 200) {
            this.alertprops.updatesuccess = true
            this.alertprops.successmessage = (response.data).response
          } else {
            this.alertprops.updatefail = true
            this.alertprops.failuremessage = response
          }
        })
    },
    removeThisFile: function () {
      const url = 'http://localhost:8080/v1/delete'
      const options = {
        method: 'DELETE',
        data: JSON.stringify({
          assetpath: this.resp.assetpath
        })
      }
      axios(url, options)
        .then(response => {
          if (response.status === 200) {
            window.location.reload()
          }
        })
        .catch(error => {
          this.deletealertprops.delete = true
          this.deletealertprops.del = error
        })
    }
  }
}
</script>

<style>
#butn{
  padding-top: 20px;
}
#btn{
    background-color: black;
    float: right;
}
#btn1{
  background-color: black;
  float: right;
  margin-left: 10px;
}
#customdropzone{
  background-color: white;
}
#customdropzone:hover{
  background-color: rgb(248, 242, 242);
}
#alert{
  margin-top: 20px;
}
</style>
