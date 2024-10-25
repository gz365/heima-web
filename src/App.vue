<!-- eslint-disable no-unused-vars -->
<script setup>
// import { RouterLink, RouterView } from 'vue-router'
import LiveCamera from './components/LiveCamera.vue'
import { ref } from 'vue'

const text_arr_ref = ref([])
const ws_status = ref('')

let ws = new WebSocket('ws://127.0.0.1:8124')

// 连接成功后的回调函数
ws.onopen = function () {
  console.log('客户端连接成功')
  ws_status.value = '连接服务成功'
  // 向服务器发送消息
  ws.send('client connected')
}

// 从服务器接受到信息时的回调函数
ws.onmessage = function (e) {
  const data = e.data
  if (data === 'over') {
    ws.close()
  }
  text_arr_ref.value = [...text_arr_ref, data]
}

// 连接关闭后的回调函数
ws.onclose = function () {
  console.log('关闭客户端连接')
  ws_status.value = '服务已断开'
}

// 连接失败后的回调函数
ws.onerror = function () {
  ws_status.value = '连接出现异常'
}

// 监听窗口关闭事件，当窗口关闭时，主动去关闭websocket连接，防止连接还没断开就关闭窗口，这样服务端会抛异常。
window.onbeforeunload = function () {
  ws.close()
}

function doAnalyze() {
  // let step = 1
  // const interval = setInterval(() => {
  //   text_arr_ref.value = [...text_arr_ref.value, '步骤' + step]
  //   step++
  //   if (step >= 5) {
  //     clearInterval(interval)
  //   }
  // }, 1000)
  ws.send('safeRope')
}
</script>

<template>
  <div class="app">
    <LiveCamera />
    <div>
      <p>{{ ws_status }}</p>
      <button @click="doAnalyze">分析安全带佩戴情况</button>
      <div>
        <p v-for="(item, index) in text_arr_ref" :key="index">
          {{ item }}
        </p>
      </div>
    </div>
  </div>
</template>

<style scoped lang="scss">
.app {
  display: grid;
  grid-template-columns: 700px auto;
}
</style>
