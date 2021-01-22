<template>
    <footer class="footer">
        <div class="copyright text-center align-text-bottom">
            &copy; {{ new Date().getFullYear() }}
            <a href="https://github.com/bhatneha/compose" target="_blank">Unpackker</a>, Happy packing and unpacking.
        </div>
    </footer>
</template>

<script>
export default {
}
</script>

<style scoped>
.footer{
    background-color: #f7f7f7;
    position:absolute;
    bottom: 0;
    width: 100%;
    height: 40px;
    align-items: center;
    line-height: 40px;
}
</style>
