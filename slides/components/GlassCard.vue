<template>
  <div 
    class="glass-card relative overflow-hidden rounded-2xl p-6 shadow-xl transition-all duration-300 hover:-translate-y-1"
    :style="{ borderTop: accent ? `4px solid ${activeColor}` : 'none' }"
  >
    <div v-if="icon" class="absolute top-4 right-4 text-5xl opacity-20 pointer-events-none">
      {{ icon }}
    </div>
    <slot />
  </div>
</template>

<script setup>
import { computed } from 'vue'
import { globalSettings } from '../composables/useSettings.js'

const props = defineProps({
  accent: { type: Boolean, default: false },
  color: { type: String, default: '' },
  icon: { type: String, default: '' }
})

const activeColor = computed(() => props.color || globalSettings.value.themeColor)
</script>

<style scoped>
.glass-card {
  /* Darkモードの基本スタイル */
  background: rgba(30, 41, 59, 0.7);
  backdrop-filter: blur(10px);
  border: 1px solid rgba(255, 255, 255, 0.1);
}

html:not(.dark) .glass-card {
  /* Lightモード時は白ベースのすりガラスに自動反転 */
  background: rgba(255, 255, 255, 0.7);
  border: 1px solid rgba(0, 0, 0, 0.1);
  box-shadow: 0 10px 25px rgba(0,0,0,0.05);
}
</style>
