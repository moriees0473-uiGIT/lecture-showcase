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
      <button class="speaker-mini" @click.stop="handleEnClick" title="英語のみ再生">
        <carbon:volume-up />
      </button>
      <span class="en-text" v-html="enHtml"></span>
    </div>
  </div>
</template>

<script setup>
import { computed, onMounted, onUnmounted } from 'vue'
import { globalSettings } from '../composables/useSettings.js'
import { useSpeech } from '../composables/useSpeech.js'

const props = defineProps({
  jp: String,
  en: String,
  text: String
})

// --- 表示用ロジック ---
const displayInput = computed(() => props.text || props.jp || "")
const speechInput = computed(() => props.jp || props.text || "")
const isAutoNextMarker = computed(() => displayInput.value.trim().endsWith('(+e)'))
const hasEn = computed(() => props.en && props.en.trim() !== "")
const canAutoNext = computed(() => isAutoNextMarker.value && hasEn.value)

const applyHighlight = (str) => {
  if (!str) return ""
  let s = str
  s = s.replace(/\[n\](.*?)\[\/n\]/g, '<span class="hl-n">$1</span>')
  s = s.replace(/\[v\](.*?)\[\/v\]/g, '<span class="hl-v">$1</span>')
  s = s.replace(/\[it\](.*?)\[\/it\]/g, '<span class="hl-it">$1</span>')
  return s
}

const jpHtml = computed(() => applyHighlight(displayInput.value.replace(/\(\+e\)\s*$/, "")))
const enHtml = computed(() => applyHighlight(props.en))

// --- 音声再生処理 ---
const { speakJP, speakEN, cancelSpeech } = useSpeech(globalSettings)

const handleJpClick = async () => {
  cancelSpeech()
  await speakJP(speechInput.value)
  if (canAutoNext.value) setTimeout(() => speakEN(props.en), 500)
}

const handleEnClick = () => {
  cancelSpeech()
  speakEN(props.en)
}

// --- キーボードショートカット設定（Jキー・Eキー） ---
const handleKeyDown = (event) => {
  // 検索ボックスなどに文字を入力している時は反応させない安全対策
  if (['INPUT', 'TEXTAREA'].includes(event.target.tagName)) return

  const key = event.key.toLowerCase()
  if (key === 'j') {
    handleJpClick()
  } else if (key === 'e') {
    handleEnClick()
  }
}

// 画面に表示された時にキー監視を開始
onMounted(() => {
  if (typeof window !== 'undefined') {
    window.addEventListener('keydown', handleKeyDown)
  }
})

// 画面から消えた時にキー監視を解除
onUnmounted(() => {
  if (typeof window !== 'undefined') {
    window.removeEventListener('keydown', handleKeyDown)
  }
})
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
.row { display: flex; align-items: center; gap: 10px; }
.en-row {
  margin-top: 6px;
  opacity: 0.8;
  font-size: 0.9em;
  border-top: 1px dashed color-mix(in srgb, v-bind('globalSettings.themeColor') 20%, transparent);
  padding-top: 4px;
}
.speaker-mini {
  background: transparent; border: none; cursor: pointer; padding: 2px;
  color: v-bind('globalSettings.themeColor'); opacity: 0.5; transition: all 0.2s; flex-shrink: 0;
}
html.dark .speaker-mini {
  color: color-mix(in srgb, v-bind('globalSettings.themeColor'), white 80%); opacity: 0.7;
}
.speaker-mini:hover { opacity: 1; transform: scale(1.1); }
.en-text { font-style: italic; }
:deep(.hl-n) { color: #e11d48; font-weight: bold; }
:deep(.hl-v) { color: #059669; font-weight: bold; }
:deep(.hl-it) { 
  color: #2563eb; font-weight: bold; 
  border-bottom: 2px solid color-mix(in srgb, #2563eb 40%, transparent);
}
html.dark :deep(.hl-it) {
  color: #7dd3fc;
  border-bottom-color: color-mix(in srgb, #7dd3fc 40%, transparent);
}
</style>