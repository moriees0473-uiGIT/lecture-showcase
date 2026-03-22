<template>
  <div class="timeline-container">
    <div 
      v-for="(era, index) in eras" 
      :key="index" 
      class="timeline-step"
      v-click
    >
      <div v-if="index > 0" class="arrow-container">
        <carbon:arrow-right class="arrow-icon" />
      </div>

      <div class="era-card">
        <div class="image-wrapper">
          <img :src="era.image" :alt="era.title" />
        </div>
        <div class="era-info">
          <h3 class="era-title">{{ era.title }}</h3>
          <p class="era-desc">{{ era.desc }}</p>
        </div>
      </div>
    </div>
  </div>
</template>

<script setup>
import { computed } from 'vue'
import { globalSettings } from '../composables/useSettings.js'

// プロパティとして時代（eras）の配列を受け取る
const props = defineProps({
  eras: {
    type: Array,
    required: true
  }
})

// CSSにテーマカラーを渡すための準備
const themeColor = computed(() => globalSettings.value.themeColor || '#3b82f6')
</script>

<style scoped>
.timeline-container {
  display: flex;
  align-items: center;
  justify-content: center;
  gap: 10px;
  width: 100%;
  margin-top: 20px;
}

/* 各ステップを横並びにする */
.timeline-step {
  display: flex;
  align-items: center;
}

/* --- 矢印のデザイン --- */
.arrow-container {
  margin: 0 15px;
  color: v-bind(themeColor); /* 矢印の色をテーマカラーに連動 */
  opacity: 0.8;
}
.arrow-icon {
  font-size: 32px;
}

/* --- カードのデザイン --- */
.era-card {
  display: flex;
  flex-direction: column;
  align-items: center;
  text-align: center;
  background: var(--slidev-theme-surface, #f9fafb);
  border: 2px solid var(--slidev-theme-border, #e5e7eb);
  border-radius: 12px;
  padding: 16px;
  width: 180px; /* カードの幅 */
  box-shadow: 0 4px 6px rgba(0,0,0,0.05);
  transition: transform 0.3s, border-color 0.3s;
}

/* ダークモード対応 */
html.dark .era-card {
  background: #2a2a2a;
  border-color: #444;
}

/* ホバー時にテーマカラーの枠線が光って少し浮き上がるおまけエフェクト */
.era-card:hover {
  transform: translateY(-5px);
  border-color: v-bind(themeColor);
}

/* --- 画像のデザイン --- */
.image-wrapper {
  width: 100px;
  height: 100px;
  margin-bottom: 12px;
  border-radius: 50%; /* 画像を丸く切り抜く */
  overflow: hidden;
  border: 3px solid color-mix(in srgb, v-bind(themeColor) 30%, transparent);
}
.image-wrapper img {
  width: 100%;
  height: 100%;
  object-fit: cover; /* 画像の縦横比を維持して綺麗に埋める */
}

/* --- テキストのデザイン --- */
.era-title {
  margin: 0 0 8px 0;
  font-size: 1.1rem;
  font-weight: bold;
  color: v-bind(themeColor); /* タイトルもテーマカラーに */
}
.era-desc {
  margin: 0;
  font-size: 0.85rem;
  color: #666;
  line-height: 1.4;
}
html.dark .era-desc {
  color: #aaa;
}
</style>