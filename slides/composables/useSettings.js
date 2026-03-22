// composables/useSettings.js
import { useStorage } from '@vueuse/core'

export const globalSettings = useStorage('lecture-slidev-settings', {
  theme: 'system',
  themeColor: '#001529', // 追加: スライドのベースカラー
  fontSize: 'text-5xl',  // 追加: タイトルのフォントサイズ
  jpVoiceURI: '',
  jpSpeed: 1.0,
  enVoiceURI: '',
  enSpeed: 1.0
})