// composables/useSettings.js
import { useStorage } from '@vueuse/core'

export const globalSettings = useStorage('lecture-slidev-settings', {
  theme: 'system',
  themeColor: '#001529',
  fontSize: 'text-5xl',
  
  // 日本語の音声指定
  jpVoiceURI: 'Microsoft Nanami Online (Natural) - Japanese (Japan)', 
  jpSpeed: 0.9,
  
  // 英語の音声指定（追加部分）
  enVoiceURI: 'Microsoft Michelle Online (Natural) - English (United States)',
  enSpeed: 1.0
})