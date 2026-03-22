<template>
  <div class="sentence">
    <div class="row" v-if="displayInput">
      <button class="speaker-mini" @click="handleJpClick" :title="canAutoNext ? '日本語→英語を連続再生' : '日本語のみ再生'">
        <carbon:volume-up-filled v-if="canAutoNext" />
        <carbon:volume-up v-else />
      </button>
      <span class="jp-text" v-html="jpHtml"></span>
    </div>

    <div class="row en-row" v-if="hasEn">
      <button class="speaker-mini" @click="speakEN" title="英語のみ再生">
        <carbon:volume-up />
      </button>
      <span class="en-text" v-html="enHtml"></span>
    </div>
  </div>
</template>

<script setup>
import { computed } from 'vue'
import { globalSettings } from '../composables/useSettings.js'

const props = defineProps({
  jp: String,
  en: String,
  text: String
})

// 表示用：text を優先
const displayInput = computed(() => props.text || props.jp || "")
// 読み上げ用：jp を優先
const speechInput = computed(() => props.jp || props.text || "")

// 連続再生判定
const isAutoNextMarker = computed(() => displayInput.value.trim().endsWith('(+e)'))
const hasEn = computed(() => props.en && props.en.trim() !== "")
const canAutoNext = computed(() => isAutoNextMarker.value && hasEn.value)

// 汎用ハイライト関数
const applyHighlight = (str) => {
  if (!str) return ""
  let s = str
  s = s.replace(/\[n\](.*?)\[\/n\]/g, '<span class="hl-n">$1</span>')
  s = s.replace(/\[v\](.*?)\[\/v\]/g, '<span class="hl-v">$1</span>')
  s = s.replace(/\[it\](.*?)\[\/it\]/g, '<span class="hl-it">$1</span>')
  return s
}

// 日本語HTML表示用
const jpHtml = computed(() => {
  let s = displayInput.value.replace(/\(\+e\)\s*$/, "")
  return applyHighlight(s)
})

// 英語HTML表示用
const enHtml = computed(() => applyHighlight(props.en))

// 読み上げ用（タグ除去）
const getSpeechText = (str) => {
  if (!str) return ""
  return str.replace(/\(\+e\)/g, "").replace(/\[.*?\]/g, "").trim()
}

// 日本語再生
const speakJP = () => {
  return new Promise((resolve) => {
    const textToSpeak = getSpeechText(speechInput.value)
    if (!textToSpeak) return resolve()
    const u = new SpeechSynthesisUtterance(textToSpeak)
    
    // 設定されたURIから音声を特定
    const voices = window.speechSynthesis.getVoices()
    const selectedVoice = voices.find(v => v.voiceURI === globalSettings.value.jpVoiceURI)
    if (selectedVoice) u.voice = selectedVoice
    
    u.rate = globalSettings.value.jpSpeed || 1.0
    u.lang = 'ja-JP'
    u.onend = () => resolve()
    window.speechSynthesis.speak(u)
  })
}

// 英語再生
const speakEN = () => {
  if (!hasEn.value) return
  const textToSpeak = getSpeechText(props.en)
  const u = new SpeechSynthesisUtterance(textToSpeak)
  
  // 設定されたURIから音声を特定
  const voices = window.speechSynthesis.getVoices()
  const selectedVoice = voices.find(v => v.voiceURI === globalSettings.value.enVoiceURI)
  if (selectedVoice) u.voice = selectedVoice

  u.rate = globalSettings.value.enSpeed || 1.0
  u.lang = 'en-US'
  window.speechSynthesis.speak(u)
}

const handleJpClick = async () => {
  window.speechSynthesis.cancel()
  await speakJP()
  if (canAutoNext.value) {
    setTimeout(() => speakEN(), 500)
  }
}
</script>

<style scoped>
.sentence {
  font-size: 22px;
  line-height: 1.6;
  margin-bottom: 15px;
  border-left: 4px solid v-bind('globalSettings.themeColor');
  background: color-mix(in srgb, v-bind('globalSettings.themeColor') 3%, transparent);
  padding: 10px 15px;
  border-radius: 0 6px 6px 0;
  text-align: left;
}

.row {
  display: flex;
  align-items: center;
  gap: 10px;
}

.en-row {
  margin-top: 6px;
  opacity: 0.8;
  font-size: 0.9em;
  border-top: 1px dashed color-mix(in srgb, v-bind('globalSettings.themeColor') 20%, transparent);
  padding-top: 4px;
}

.speaker-mini {
  background: transparent;
  border: none;
  cursor: pointer;
  padding: 2px;
  /* ダークモードかどうかで色を自動調整する設定に変更 */
  color: v-bind('globalSettings.themeColor');
  opacity: 0.5; /* 少しだけ基本の透明度を上げます */
  transition: all 0.2s;
  flex-shrink: 0;
}

/* ダークモード時の色を明るく上書き */
html.dark .speaker-mini {
  /* テーマカラーをベースに、80%白を混ぜて明るくします */
  color: color-mix(in srgb, v-bind('globalSettings.themeColor'), white 80%);
  opacity: 0.7;
}

.speaker-mini:hover {
  opacity: 1;
  transform: scale(1.1);
}

.en-text {
  font-style: italic;
}

:deep(.hl-n) { color: #e11d48; font-weight: bold; }
:deep(.hl-v) { color: #059669; font-weight: bold; }
:deep(.hl-it) { 
  color: #2563eb; 
  font-weight: bold; 
  border-bottom: 2px solid color-mix(in srgb, #2563eb 40%, transparent);
}

html.dark :deep(.hl-it) {
  color: #7dd3fc;
  border-bottom-color: color-mix(in srgb, #7dd3fc 40%, transparent);
}
</style>