<template>
  <div class="relative h-full w-full flex flex-col justify-center px-12 py-10 transition-colors duration-500 cover-wrapper">
    
    <div class="absolute top-6 right-6">
      <Link to="setting" class="border-none text-2xl opacity-60 hover:opacity-100 transition-opacity cursor-pointer setting-icon">
        <carbon:settings />
      </Link>
    </div>

    <div class="max-w-4xl">
      <h1 class="font-extrabold mb-6 cover-title leading-tight tracking-tight text-6xl">
        {{ title }}
      </h1>
      
      <p v-if="description" class="mb-8 leading-relaxed cover-desc font-medium text-2xl">
        {{ description }}
      </p>
      
      <ul v-if="items.length" class="space-y-4">
        <li v-for="(item, index) in items" :key="index" class="flex items-center cover-list-item text-xl">
          <span class="mr-4 cover-bullet">●</span>
          {{ item }}
        </li>
      </ul>
    </div>

    <div class="absolute bottom-4 left-4 text-[10px] opacity-20 p-1 z-50 debug-text">
      Theme: {{ globalSettings.themeColor }}
    </div>
  </div>
</template>

<script setup>
import { globalSettings } from '../composables/useSettings.js'

defineProps({
  title: { type: String, default: 'Lecture Title' },
  description: { type: String, default: '' },
  items: { type: Array, default: () => [] }
})
</script>

<style scoped>
/* 背景色：テーマカラーを15%混合 */
.cover-wrapper {
  background-color: color-mix(in srgb, v-bind('globalSettings.themeColor') 15%, #f9fafb);
}
html.dark .cover-wrapper {
  background-color: color-mix(in srgb, v-bind('globalSettings.themeColor') 15%, #121212);
}

/* 文字色 */
.cover-title { color: #1f2937; }
html.dark .cover-title { color: #ffffff; }

.cover-desc, .cover-list-item { color: #4b5563; }
html.dark .cover-desc, html.dark .cover-list-item { color: #d1d5db; }

/* アクセント色 */
.cover-bullet { color: v-bind('globalSettings.themeColor'); }
</style>