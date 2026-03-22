<template>
  <div class="terminal">
    <div class="bar">
      <span class="dot red"></span>
      <span class="dot yellow"></span>
      <span class="dot green"></span>
    </div>
    
    <pre><span class="prompt">$</span> {{ cmd }}</pre>
  </div>
</template>

<script setup>
// グローバル設定をインポート
import { globalSettings } from '../composables/useSettings'

const props = defineProps({
  cmd: String
})
</script>

<style scoped>
.terminal {
  /* ターミナルの背景に、テーマカラーを10%だけ混ぜて「ただの黒」から「テーマに合った黒」に進化させます */
  background: color-mix(in srgb, v-bind('globalSettings.themeColor') 10%, #111);
  
  /* ウィンドウの枠線にテーマカラーを適用 */
  border: 2px solid v-bind('globalSettings.themeColor');
  
  color: #00ff88; /* クラシックなハッカーグリーンは維持！ */
  padding: 20px;
  border-radius: 10px;
  font-family: 'Fira Code', Consolas, monospace; /* 少しモダンなフォント指定を追加 */
  font-size: 22px;
  
  /* 少しだけ影をつけて、スライドから浮き出ているような立体感を演出 */
  box-shadow: 0 8px 24px rgba(0,0,0,0.3);
  margin: 20px 0;
}

.bar {
  margin-bottom: 15px;
  display: flex;
}

.dot {
  display: inline-block;
  width: 12px;
  height: 12px;
  border-radius: 50%;
  margin-right: 8px;
}

.red { background: #ff5f56; }
.yellow { background: #ffbd2e; }
.green { background: #27c93f; }

pre {
  margin: 0;
  white-space: pre-wrap; /* 長いコマンドが枠外にはみ出さないように折り返し */
}

/* プロンプト記号($)のスタイル */
.prompt {
  color: v-bind('globalSettings.themeColor');
  /* 暗い背景色を選んだ場合でも見えるように、明るさを強制的に1.5倍に引き上げる魔法 */
  filter: brightness(1.5);
  font-weight: bold;
  margin-right: 4px;
}
</style>