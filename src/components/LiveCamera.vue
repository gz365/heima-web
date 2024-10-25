<template>
  <div class="live-container">
    <iframe
      src="https://aecloud-test.glodon.com/ivs/api/url/redirect/67124d03e1e2fc001dbb8e96/web"
    ></iframe>

    <iframe
      src="https://aecloud-test.glodon.com/ivs/api/url/redirect/67124d03e1e2fc001dbb8e96/web"
    ></iframe>
  </div>
</template>
<style lang="scss">
.live-container {
  background-color: #eee;
  width: 640px;
  iframe {
    display: block;
    border: none;
    width: 100%;
    height: 360px;
    &:not(:nth-child(1)) {
      margin-top: 10px;
    }
  }
}
</style>
