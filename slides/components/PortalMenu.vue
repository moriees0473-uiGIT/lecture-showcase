<template>
  <div class="portal-grid">
    <div class="card" @click="goTo(fePage)">
      <div class="icon">📘</div>
      <div class="info">
        <h3>基本情報 (FE)</h3>
        <p>アルゴリズムとデータ構造</p>
      </div>
    </div>

    <div class="card" @click="goTo(javaPage)">
      <div class="icon">☕</div>
      <div class="info">
        <h3>Java プログラミング</h3>
        <p>オブジェクト指向の基礎</p>
      </div>
    </div>

    <div class="card" @click="goTo(dockerPage)">
      <div class="icon">🐳</div>
      <div class="info">
        <h3>Docker 実習</h3>
        <p>コンテナの起動と操作</p>
      </div>
    </div>
  </div>
</template>

<script setup>
import { useRouter } from 'vue-router'
// 👇 1. computed を追加でインポートします
import { computed } from 'vue' 
// 👇 2. 念のため .js を末尾に付けてインポートを安定させます
import { globalSettings } from '../composables/useSettings.js' 

// 👇 3. CSSの v-bind に安全に渡すため、テーマカラー専用の変数を作ります
const themeColor = computed(() => globalSettings.value.themeColor)

const fePage = 'fe-start'
const javaPage = 'java-start'
const dockerPage = 'docker-start'

const router = useRouter()

function goTo(targetName) {
  router.push(`/${targetName}`)
}
</script>

<style scoped>
.portal-grid {
  display: grid;
  grid-template-columns: repeat(2, 1fr);
  gap: 20px;
  margin-top: 40px;
}

.card {
  display: flex;
  align-items: center;
  background: #f9fafb;
  padding: 20px;
  border-radius: 12px;
  cursor: pointer;
  border: 1px solid #e5e7eb;
  border-left: 4px solid transparent; 
  transition: transform 0.2s, background 0.2s, border-color 0.2s;
}

html.dark .card {
  background: #2a2a2a;
  border-color: #444;
}

.card:hover {
  transform: translateY(-5px);
  /* 👇 4. 修正：直接プロパティを書かず、上で作った変数を渡します */
  border-color: v-bind(themeColor);
  border-left: 4px solid v-bind(themeColor);
}

.card:hover {
  background: #f3f4f6;
}
html.dark .card:hover {
  background: #3a3a3a;
}

.icon {
  font-size: 40px;
  margin-right: 20px;
}

.info h3 {
  margin: 0;
  font-size: 24px;
  color: #333;
}
html.dark .info h3 {
  color: #fff;
}

.info p {
  margin: 5px 0 0 0;
  font-size: 14px;
  color: #666;
}
html.dark .info p {
  color: #aaa;
}
</style>