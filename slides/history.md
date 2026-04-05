---
remote: "your-secure-password"
---

---
layout: center
---

<div class="absolute top-6 right-6 z-50">
  <a href="setting" class="border-none text-2xl opacity-60 hover:opacity-100 transition-opacity cursor-pointer text-gray-400">
    <carbon-settings />
  </a>
</div>

<div class="text-center">
  <h1 class="text-5xl font-bold mb-4 tracking-tight">
    <span class="bg-gradient-to-r from-cyan-400 to-purple-500 bg-clip-text text-transparent">
      プログラミング言語
    </span>
    の栄枯盛衰と未来
  </h1>
  <p class="text-xl text-gray-500 dark:text-gray-400">産業構造を変革したテクノロジーの軌跡と、2026年から2036年への10年予測</p>

</div>

<!--
Iii
-->

---
layout: center
---

<div class="text-center">
  <SentencePlayer 
    text="[it]プログラミング言語[/it]は、人間とコンピュータが[v]対話するため[/v]の[n]共通言語[/n]です。" 
    en="[it]Programming languages[/it] are a common language for humans and computers to communicate."
  />

  <SentencePlayer 
    text="皆さん、おはようございます！今日から皆さんと一緒に勉強していく、[あなたの名前]です。よろしくお願いします。
    さて、講義を始める前に、まずはこの授業の進め方についてお話しします。"
  />
  <SentencePlayer 
    text="[it]Docker[/it]を[v]使って[/v]、軽量な[n]コンテナ[/n]を[v]起動します[/v]。(+e)" 
    en="Use Docker to start lightweight containers."
  />

  <SentencePlayer 
    text="[it]C言語[/it]の[n]栄枯盛衰[/n]を学びます。" 
    jp="シーげんごの えいこせいすい を まなびます。"
    en="We will learn about the rise and fall of the C language." 
  />

</div>

---
layout: default
---

# 1. 主要言語の歴史的トレンド (1970 - 2026)

過去50年以上にわたり、言語のパラダイムは大きく変化してきました。
低レイヤーのシステム制御から、Webの爆発的な普及、そして現在のAI全盛期に至るまでのシェアの変遷です。

<div class="mt-8" v-click>
  <GlassCard>
    <SimpleImage src="/history-graph.png" mode="original" />
  </GlassCard>
</div>

---
layout: default
---

# 2. 言語の誕生、直面した課題、そして進化

それぞれの言語は特定の時代背景と「解決すべき課題」を持って誕生しました。

<div class="grid grid-cols-2 gap-6 mt-6">
  <GlassCard accent color="#06b6d4" icon="⚙️" v-click>
    <h3 class="text-xl font-bold text-cyan-500 mb-2">C言語 / C++ (1970s - 80s)</h3>
    <p class="text-sm"><strong>誕生目的:</strong> UNIXの記述。アセンブリに代わる高速言語。</p>
    <p class="text-sm mt-2"><strong>課題:</strong> 手動メモリ管理によるバグと脆弱性。</p>
  </GlassCard>

  <GlassCard accent color="#ef4444" icon="☕" v-click>
    <h3 class="text-xl font-bold text-red-500 mb-2">Java (1990s)</h3>
    <p class="text-sm"><strong>誕生目的:</strong> 一度書けばどこでも動く共通基盤。</p>
    <p class="text-sm mt-2"><strong>課題:</strong> ボイラープレートの多さとメモリ消費。</p>
  </GlassCard>

  <GlassCard accent color="#facc15" icon="🌐" v-click>
    <h3 class="text-xl font-bold text-yellow-500 mb-2">JavaScript (1990s - 現在)</h3>
    <p class="text-sm"><strong>誕生目的:</strong> 静的HTMLに動的なインタラクションを追加。</p>
    <p class="text-sm mt-2"><strong>課題:</strong> 動的型付けによる大規模開発でのバグ多発。</p>
  </GlassCard>

  <GlassCard accent color="#10b981" icon="🐍" v-click>
    <h3 class="text-xl font-bold text-emerald-500 mb-2">Python (1990s - 現在)</h3>
    <p class="text-sm"><strong>誕生目的:</strong> 読みやすさを重視し、教育用からスタート。</p>
    <p class="text-sm mt-2"><strong>課題:</strong> 実行速度の遅さと並行処理の制限。</p>
  </GlassCard>
</div>

---
layout: default
---

# 3. 産業構造を変革した巨匠たち

<div class="grid grid-cols-2 gap-6 mt-10">
  <div class="border-l-4 border-cyan-500 pl-4" v-click>
    <h4 class="text-xl font-bold">Dennis Ritchie</h4>
    <p class="text-cyan-500 text-sm">C言語の父 / UNIXの共同開発者</p>
    <p class="text-sm mt-2 text-gray-500 dark:text-gray-400">現代のすべてのOSとソフトウェア産業の礎を築いた。</p>
  </div>
  
  <div class="border-l-4 border-red-500 pl-4" v-click>
    <h4 class="text-xl font-bold">James Gosling</h4>
    <p class="text-red-500 text-sm">Javaの父</p>
    <p class="text-sm mt-2 text-gray-500 dark:text-gray-400">エンタープライズITを爆発的に成長させた。</p>
  </div>

  <div class="border-l-4 border-yellow-500 pl-4 mt-4" v-click>
    <h4 class="text-xl font-bold">Brendan Eich</h4>
    <p class="text-yellow-500 text-sm">JavaScriptの生みの親</p>
    <p class="text-sm mt-2 text-gray-500 dark:text-gray-400">Webを巨大なアプリケーションプラットフォームに変貌させた。</p>
  </div>

  <div class="border-l-4 border-emerald-500 pl-4 mt-4" v-click>
    <h4 class="text-xl font-bold">Guido van Rossum</h4>
    <p class="text-emerald-500 text-sm">Pythonの父</p>
    <p class="text-sm mt-2 text-gray-500 dark:text-gray-400">プログラミングを民主化し、AI/データサイエンス革命の原動力に。</p>
  </div>
</div>

---
layout: default
---

# 4. プログラミング言語の進化フロー

言語は互いに影響を与え合いながら進化してきました。
システム記述から始まり、Web、AI、そして安全性へとパラダイムが遷移しています。

<div class="mt-12 flex flex-col items-center justify-center space-y-8">
  <div class="flex items-center space-x-4" v-click>
    <span class="px-4 py-2 bg-cyan-100 dark:bg-cyan-900 text-cyan-700 dark:text-cyan-300 rounded font-bold">C / C++</span>
    <span>➡️</span>
    <span class="px-4 py-2 bg-red-100 dark:bg-red-900 text-red-700 dark:text-red-300 rounded font-bold">Java / C#</span>
    <span>➡️</span>
    <span class="px-4 py-2 bg-orange-100 dark:bg-orange-900 text-orange-700 dark:text-orange-300 rounded font-bold">Rust / Go</span>
  </div>
  
  <div class="flex items-center space-x-4" v-click>
    <span class="px-4 py-2 bg-gray-100 dark:bg-slate-700 text-gray-700 dark:text-slate-300 rounded font-bold">HTML / CSS</span>
    <span>➡️</span>
    <span class="px-4 py-2 bg-yellow-100 dark:bg-yellow-900 text-yellow-700 dark:text-yellow-300 rounded font-bold">JavaScript</span>
    <span>➡️</span>
    <span class="px-4 py-2 bg-blue-100 dark:bg-blue-900 text-blue-700 dark:text-blue-300 rounded font-bold">TypeScript / Wasm</span>
  </div>
</div>

---
layout: two-cols
---

# 5. 今後10年の予想動向
<p class="text-sm text-gray-500 dark:text-gray-400 mb-4">AIの台頭、セキュリティへの要求により言語の役割が再定義されます。</p>

<div class="pr-4">
  <GlassCard>
    <SimpleImage src="/history-graph.png" height="500px" />
  </GlassCard>
</div>

::right::

<div class="mt-16 pl-4 space-y-6">
  <div v-click>
    <h4 class="text-lg font-bold">🤖 自然言語の言語化</h4>
    <p class="text-sm text-gray-500 dark:text-gray-400">コードを書くのではなくAIに「指示する」時代へ。コーディングの70%が自動化されます。</p>
  </div>
  
  <div v-click>
    <h4 class="text-lg font-bold">🛡️ Rustによる置き換え</h4>
    <p class="text-sm text-gray-500 dark:text-gray-400">メモリ安全性が最優先され、インフラ層のRust化が進行します。</p>
  </div>
  
  <div v-click>
    <h4 class="text-lg font-bold">⚡ WebAssemblyの普遍化</h4>
    <p class="text-sm text-gray-500 dark:text-gray-400">あらゆる環境の共通実行フォーマットとして定着します。</p>
  </div>
</div>

---
src: ./setting.md
---
