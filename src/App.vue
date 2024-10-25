<script setup>
// import { RouterLink, RouterView } from 'vue-router'
import LiveCamera from './components/LiveCamera.vue'
import { ref } from 'vue'

const text_arr_ref = ref([])
let step = 1
const interval = setInterval(() => {
  text_arr_ref.value = [...text_arr_ref.value, '步骤' + step]
  step++
  if (step >= 5) {
    clearInterval(interval)
  }
}, 1000)
</script>

<template>
  <div class="app">
    <LiveCamera />
    <div>
      <button>分析安全带佩戴情况</button>

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
