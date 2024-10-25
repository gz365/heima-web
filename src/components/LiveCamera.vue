<template>
  <div class="live-container">
    <iframe
      src="https://aecloud-test.glodon.com/ivs/api/url/redirect/671b3781dd51ca001d7a6eb0/web"
    ></iframe>

    <iframe
      src="https://aecloud-test.glodon.com/ivs/api/url/redirect/671b3781dd51ca001d7a6eb1/web"
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
