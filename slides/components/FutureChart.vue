<template>
  <div class="chart-container" style="position: relative; height:350px; width:100%">
    <canvas ref="canvas"></canvas>
  </div>
</template>

<script setup>
import { ref, onMounted, onUnmounted } from 'vue'
// ❌ ここにあった static import を削除しました

const canvas = ref(null)
let chartInstance = null

// 👇 async を追加し、非同期で処理できるようにします
onMounted(async () => {
  // 👇 ここで初めて Chart.js を動的に読み込みます（SSRエラー回避の鉄則）
  const { default: Chart } = await import('chart.js/auto')

  const historyLabels = ['1970s', '1980s', '1990s', '2000s', '2010s', '2020s', '2026(Now)']
  
  chartInstance = new Chart(canvas.value, {
    type: 'line',
    data: {
      labels: historyLabels,
      datasets: [
        { label: 'C / C++', data: [90, 85, 60, 40, 30, 20, 18], borderColor: '#06b6d4', backgroundColor: 'rgba(6, 182, 212, 0.1)', borderWidth: 3, tension: 0.4, fill: true },
        { label: 'Java', data: [0, 0, 80, 95, 70, 45, 35], borderColor: '#ef4444', backgroundColor: 'rgba(239, 68, 68, 0.1)', borderWidth: 3, tension: 0.4, fill: true },
        { label: 'JavaScript', data: [0, 0, 20, 50, 85, 90, 88], borderColor: '#facc15', backgroundColor: 'rgba(250, 204, 21, 0.1)', borderWidth: 3, tension: 0.4, fill: true },
        { label: 'Python', data: [0, 5, 10, 20, 60, 95, 100], borderColor: '#10b981', backgroundColor: 'rgba(16, 185, 129, 0.1)', borderWidth: 3, tension: 0.4, fill: true }
      ]
    },
    options: {
      responsive: true,
      maintainAspectRatio: false,
      scales: {
        y: { max: 100, title: { display: true, text: '影響力指数' } }
      }
    }
  })
})

onUnmounted(() => {
  if (chartInstance) chartInstance.destroy()
})
</script>