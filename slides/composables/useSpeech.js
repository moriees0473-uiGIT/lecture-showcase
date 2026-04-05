import { globalSettings } from './useSettings.js'

export function useSpeech(settings) {
  const getSpeechText = (str) => {
    if (!str) return ""
    return str.replace(/\(\+e\)/g, "").replace(/\[.*?\]/g, "").trim()
  }

  // iOS対策1: 音声リストの読み込みを強制的に促す
  if (typeof window !== 'undefined' && window.speechSynthesis) {
    window.speechSynthesis.getVoices()
    window.speechSynthesis.onvoiceschanged = () => {
      window.speechSynthesis.getVoices()
    }
  }

  // iPadとPCで声の種類が違う問題の対策関数
  const getSafeVoice = (langPrefix, preferredUri) => {
    const voices = window.speechSynthesis.getVoices()
    if (voices.length === 0) return null

    let voice = voices.find(v => v.voiceURI === preferredUri)
    if (!voice) {
      voice = voices.find(v => v.lang.startsWith(langPrefix))
    }
    return voice
  }

  const speakJP = (text) => {
    return new Promise((resolve) => {
      const textToSpeak = getSpeechText(text)
      if (!textToSpeak) return resolve()

      window.speechSynthesis.cancel()

      try {
        const u = new SpeechSynthesisUtterance(textToSpeak)
        const safeVoice = getSafeVoice('ja', settings.value.jpVoiceURI)
        if (safeVoice) u.voice = safeVoice
        
        u.rate = settings.value.jpSpeed || 1.0
        u.lang = 'ja-JP'
        
        u.onend = () => resolve()
        u.onerror = () => resolve() // エラーが起きてもフリーズさせない
        
        window.speechSynthesis.speak(u)
      } catch (err) {
        resolve()
      }
    })
  }

  const speakEN = (text) => {
    const textToSpeak = getSpeechText(text)
    if (!textToSpeak) return

    window.speechSynthesis.cancel()

    try {
      const u = new SpeechSynthesisUtterance(textToSpeak)
      const safeVoice = getSafeVoice('en', settings.value.enVoiceURI)
      if (safeVoice) u.voice = safeVoice
      
      u.rate = settings.value.enSpeed || 1.0
      u.lang = 'en-US'
      
      window.speechSynthesis.speak(u)
    } catch (err) {
      // 英語再生時のエラーも静かに無視する
    }
  }
  
  const cancelSpeech = () => {
    if (typeof window !== 'undefined') {
      window.speechSynthesis.cancel()
    }
  }

  return { speakJP, speakEN, cancelSpeech }
}