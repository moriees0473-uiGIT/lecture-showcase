<template>
  <div class="image-panel">
    <img 
      :src="src" 
      :style="{ borderColor: globalSettings.themeColor }"
      class="theme-border"
    >
    <div class="caption">
      {{ caption }}
    </div>
  </div>
</template>

<script setup>
// グローバル設定をインポート
import { globalSettings } from '../composables/useSettings'

const props = defineProps({
  src: String,
  caption: String
})
</script>

<style scoped>
.image-panel {
  text-align: center;
  margin-top: 30px;
}

img {
  max-width: 900px;
  border-radius: 8px;
  /* デフォルトでは透明な枠線を設定しておき、色だけ動的に変える */
  border: 4px solid transparent; 
  /* 色が変更されたときにフワッと変わるアニメーション */
  transition: border-color 0.5s ease;
}

.caption {
  margin-top: 10px;
  color: #aaa;
  font-size: 20px;
}
</style>