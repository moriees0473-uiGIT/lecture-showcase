<template>
  <div class="image-container" :style="containerStyle">
    <img :src="src" :alt="alt" class="image-content" :style="imageStyle" />
  </div>
</template>

<script setup>
import { computed } from 'vue'

const props = defineProps({
  // 画像のファイルパス (例: '/chart.png')
  src: { type: String, required: true },
  alt: { type: String, default: 'スライド画像' },
  
  // サイズ調整モード
  // 'contain' : (デフォルト) アスペクト比を維持して枠内にピッタリ収める（拡大・縮小あり）
  // 'original': 画像本来の解像度（サイズ）を維持する
  // 'cover'   : 枠を完全に埋めるように拡大し、はみ出た部分は切り取る
  mode: { type: String, default: 'contain' },
  
  // 親枠がない場合に、自分で高さを指定するためのオプション
  height: { type: String, default: '350px' }
})

// 外側の枠のスタイル
const containerStyle = computed(() => ({
  width: '100%',
  height: props.height,
  display: 'flex',
  justifyContent: 'center', // 中央寄せ
  alignItems: 'center',
  overflow: 'hidden' // 原寸大ではみ出した場合は隠す
}))

// 中身の画像本体のスタイル
const imageStyle = computed(() => {
  if (props.mode === 'original') {
    return {
      objectFit: 'none', // 画像のサイズを変えない
      maxWidth: 'none'
    }
  } else if (props.mode === 'cover') {
    return {
      width: '100%',
      height: '100%',
      objectFit: 'cover' // 枠を埋める
    }
  } else {
    return {
      width: '100%',
      height: '100%',
      objectFit: 'contain' // 枠内に収める（デフォルト）
    }
  }
})
</script>

<style scoped>
.image-content {
  border-radius: 8px; /* 少しだけ角を丸くしてオシャレに */
}
</style>