# LinkSentinel Pro.
**A lightweight yet powerful tool to long-term monitor internet connectivity on Windows 7/8/10/11 PC — 24/7 logging, visible or hidden.**

### 🧠 What is LinkSentinel?
**LinkSentinel** is a simple but powerful PowerShell script that allows any Windows 10 or 11 machine to monitor its internet connection status continuously, either **visibly** (with console output) or **silently** (in background).
It immediately creates a log file that tracks connection status every few seconds (customizable by the user), and logs are readable and openable at any time — even while the script is running.
To avoid huge log files, a new log file is automatically started every 24 hours, named like: "Log_monitor_YYYY-MM-DD.txt"

---

### 📝 Key Features
- Periodically checks internet connectivity using trusted targets (Google, Microsoft, Cloudflare hosts or whatever you want *require editing)
- Customizable check interval (e.g., every 10 seconds)
- Real-time logging to a readable `.txt` file (created in the same directory)
- Automatic log rotation: one log file per day
- Run visibly in console or silently in background (You choose)
- No installation required — just run

---

### 🚀 How to Use
1. Clone or download the repository
2. Launch the `Start_hidden.bat` file to run in background, or run `Start_console.bat` to run in visible console mode
3. By default, the check and log interval is set to 10 seconds - you can edit this interval editing the Script.ps1 file, to the last line "Start-Sleep -Seconds 10"
4. By default, LinkSentinel checks connectivity to Google, Microsoft, and Cloudflare servers. If you want to modify these targets, edit the script.ps1 file to the section: "$targets = @("
5. The logging will start immediately and create the first log file in the same folder with this naming format "Log_monitor_YYYY-MM-DD.txt"

### Windows 7 PC requirements:
1. Windows 7 SP1 (Service Pack 1) -> Download [here](https://www.catalog.update.microsoft.com/Search.aspx?q=KB976932)
2. Windows Management Framework 5.1 -> Download [here](https://www.microsoft.com/en-us/download/details.aspx?id=54616)
3. .NET Framework 4.5 o superiore -> Download [here](https://www.microsoft.com/it-it/download/details.aspx?id=30653)

---

### 📄 License
This project is released under the **MIT License**.  
You are free to use, modify, and distribute it, as long as credit is given.

---

### ✍️ Authors & Credits
- **Script & concept:** DraftmanCorp.
- **Chart.js:** [license](https://github.com/chartjs/Chart.js/blob/master/LICENSE.md) by [Chartjs](https://github.com/chartjs/Chart.js).
- **Technical support & development:** [ChatGPT by OpenAI](https://openai.com/chatgpt)

---

> ℹ️ LinkSentinel was built to provide a lightweight, reliable monitoring solution — perfect for long-term diagnosing network issues or keeping long-term logs of your internet link without installing any third-party tools.
