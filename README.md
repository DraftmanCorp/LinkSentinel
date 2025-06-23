# LinkSentinel
**A lightweight yet powerful tool to long-term monitor internet connectivity on Windows PC — 24/7 logging, visible or hidden.**

## 🧠 What is LinkSentinel?
**LinkSentinel** is a simple but powerful PowerShell script that allows any Windows 10 or 11 machine to monitor its internet connection status continuously, either **visibly** (with console output) or **silently** (in background).
It immediately creates a log file that tracks connection status every few seconds (customizable by the user), and logs are readable and openable at any time — even while the script is running.
To avoid huge log files, a new log file is automatically started every 24 hours, named like: "Log_monitor_YYYY-MM-DD.txt"

## 📝 Key Features
- 🔄 Periodically checks internet connectivity using trusted targets (Google, Microsoft, Cloudflare hosts or whatever you want *require editing)
- 🕒 Customizable check interval (e.g., every 10 seconds)
- 💾 Real-time logging to a readable `.txt` file (created in the same directory)
- 📁 Automatic log rotation: one log file per day
- 👁️ Run visibly in console or silently in background (You choose)
- 🧩 No installation required — just run

---

## 🚀 How to Use
1. Clone or download the repository
2. Launch the `Start_hidden.bat` file to run in background, or run `Start_console.bat` to run in visible console mode
3. The logging will start immediately and create the first log file in the same folder with this naming format "Log_monitor_YYYY-MM-DD.txt"

---

## 📄 License
This project is released under the **MIT License**.  
You are free to use, modify, and distribute it, as long as credit is given.

---

## ✍️ Authors
- **Script & concept:** DraftmanCorp.
- **Technical support & development:** [ChatGPT by OpenAI](https://openai.com/chatgpt)

---

> ℹ️ LinkSentinel was built to provide a lightweight, reliable monitoring solution — perfect for long-term diagnosing network issues or keeping long-term logs of your internet link without installing any third-party tools.
