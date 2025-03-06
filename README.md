# Cursor Pro Trial Reset Tools

A collection of tools to help manage and reset Cursor IDE trial limitations. This repository is based on the work from [yuaotian/go-cursor-help](https://github.com/yuaotian/go-cursor-help).

## ⚠️ Disclaimer

This tool is for educational purposes only. Use at your own discretion and risk.

## 🚀 Quick Start

Choose the appropriate command for your operating system:

### Windows:
```powershell
irm https://raw.githubusercontent.com/HarborAI-Solutions/cursor-pro-trial-reset-tools/main/scripts/run/cursor_win_id_modifier.ps1 | iex
```

### macOS:
```bash
curl -fsSL https://raw.githubusercontent.com/HarborAI-Solutions/cursor-pro-trial-reset-tools/main/scripts/run/cursor_mac_id_modifier.sh | sudo bash
```

### Linux:
```bash
curl -fsSL https://raw.githubusercontent.com/HarborAI-Solutions/cursor-pro-trial-reset-tools/main/scripts/run/cursor_linux_id_modifier.sh | sudo bash
```

## 🔧 What This Tool Does

This tool helps resolve common Cursor IDE issues such as:
- "Too many free trial accounts used on this machine"
- "You've reached your trial request limit"
- API key limitations

## 💻 System Requirements

### Windows
- PowerShell (Windows PowerShell or PowerShell 7)
- Administrator privileges
- Windows 10/11 (64-bit or 32-bit)

### macOS
- Terminal access
- sudo privileges
- Intel or Apple Silicon (M1/M2) processor

### Linux
- Terminal access
- sudo privileges
- x64, x86, or ARM64 architecture

## 📝 Technical Details

### Modified Files
The tool modifies Cursor's configuration file located at:
- Windows: `%APPDATA%\Cursor\User\globalStorage\storage.json`
- macOS: `~/Library/Application Support/Cursor/User/globalStorage/storage.json`
- Linux: `~/.config/Cursor/User/globalStorage/storage.json`

### Safety Features
- Automatic backup of original configuration
- Safe process termination
- Error handling and recovery

## 🛡️ Safety Precautions

1. The tool will create backups before making any changes
2. All modifications are reversible
3. No permanent system changes are made

## 📚 Usage Tips

1. Close Cursor IDE before running the tool
2. Run with administrator/sudo privileges
3. Verify the backup files are created
4. Restart Cursor IDE after running the tool

## ⚙️ Manual Installation

If you prefer not to use the one-line installers, you can:
1. Download the appropriate script from the `scripts/run/` directory
2. Run it locally with administrator/sudo privileges

## 🤝 Contributing

Contributions are welcome! Please feel free to submit a pull request.

## 📄 License

MIT License - See [LICENSE](LICENSE) file for details

## 🔗 Credits

Based on the work from [yuaotian/go-cursor-help](https://github.com/yuaotian/go-cursor-help)