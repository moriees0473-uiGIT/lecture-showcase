<template>
  <div class="scroll-wrapper" :style="{ maxHeight: height }">
    <slot />
  </div>
</template>

<script setup>
// グローバル設定をインポート
import { globalSettings } from '../composables/useSettings'

const props = defineProps({
  // 💡 親が知るべきなのは「自分の高さ」だけです。子のデータ(srcなど)はここには書きません！
  height: {
    type: String,
    default: '400px'
  }
})
</script>

<style scoped>
.scroll-wrapper {
  overflow-y: auto;
  padding-right: 12px; /* スクロールバーと中身が被らないように余白をあける */
}

/* スクロールバーの全体幅 */
.scroll-wrapper::-webkit-scrollbar {
  width: 8px;
}

/* スクロールバーの背景（軌道） */
.scroll-wrapper::-webkit-scrollbar-track {
  background: transparent;
}

/* 👇 スクロールバーのつまみ部分に themeColor を適用 */
.scroll-wrapper::-webkit-scrollbar-thumb {
  /* color-mixを使ってテーマカラーを50%の薄さにし、上品な半透明にします */
  background-color: color-mix(in srgb, v-bind('globalSettings.themeColor') 50%, transparent);
  border-radius: 4px;
  transition: background-color 0.2s;
}

/* ホバー時は少し色を濃く（80%）して操作しやすくする */
.scroll-wrapper::-webkit-scrollbar-thumb:hover {
  background-color: color-mix(in srgb, v-bind('globalSettings.themeColor') 80%, transparent);
}

/* ダークモード時の微調整（少し明るく見せるために60%に設定） */
html.dark .scroll-wrapper::-webkit-scrollbar-thumb {
  background-color: color-mix(in srgb, v-bind('globalSettings.themeColor') 60%, transparent);
}
</style>