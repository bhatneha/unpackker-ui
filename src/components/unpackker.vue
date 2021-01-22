<template>
    <div>
        <b-card class="shadow-sm p-3 mb-5 bg-white rounded">
            <b-card-header header-bg-variant="transparent" header-tag="h4" class="text-center">Unpackker</b-card-header>
            <vue-dropzone ref="myVueDropzone" id="customdropzone" :options="dropzoneOptions" :useCustomSlot="true" :duplicateCheck="true" @vdropzone-duplicate-file="duplicatecheck">
              Drop your packed asset here or click to upload !</vue-dropzone>
                <b-alert variant="danger" dismissible :show="duplicate.dups" @dismissed="duplicate.dups=false" id="alert"> {{ this.duplicate.dup }} </b-alert>
            <div class="text-center" id="butn">
              <b-button id="btn">Unpack</b-button>
            </div>
        </b-card>
    </div>
</template>

<script>
import vue2Dropzone from 'vue2-dropzone'

export default {
  name: 'Unpackker',
  components: {
    vueDropzone: vue2Dropzone
  },
  data: () => ({
    duplicate: {
      dups: false,
      dup: ''
    },
    dropzoneOptions: {
      url: 'https://httpbin.org/post',
      maxFilesize: 30,
      addRemoveLinks: true
      // method: 'post'
    }
  }),
  methods: {
    duplicatecheck (file) {
      this.duplicate.dups = true
      this.duplicate.dup = 'Oops! Unpacking multiple assets is not supported'
    }
  }
}
</script>
