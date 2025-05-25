# CLI Assistant 

A simple and extensible command-line assistant tool built using Bash, OpenAI's API, and wttr.in for weather info. Designed for CLI lovers and Unix beginners to get quick answers, weather updates, and system info with ease.

---

## Features

-  Ask AI-powered questions using OpenAI's ChatGPT (`gpt-3.5-turbo`)
-  Get quick weather updates via [wttr.in](https://wttr.in)
-  Check system time and uptime
-  See who you are (`whoami`)
-  View disk usage
-  Clear the terminal
-  Manual and help built-in

---

##  Setup Instructions

### 1. Fork and Clone

First, fork this repo and clone it to your local machine.



### 2. Create `.env` File

Create a `.env` file in the same directory as `ai_helper.sh` and `ask.sh`:

```bash
touch .env
```

Add your OpenAI API key in the following format:

```env
xyz="your_openai_api_key_here"
```

>  If you decide to change the variable name from `xyz`, make sure to update the `ai_helper.sh` script accordingly.

---

## Usage

Make your scripts executable:

```bash
chmod +x ask.sh ai_helper.sh
```

Then start the assistant:

```bash
./ask.sh ask
```

Inside the prompt, you can type:

```
ask> weather
ask> weather full
ask> ai
ask> time
ask> disk
ask> whoami
ask> clear
ask> uptime
ask> help
ask> exit
```

You can also view the manual anytime:

```bash
./ask.sh man
```

---

##  Author

Kushal Panthi

---

##  Acknowledgements

- Big thanks to [wttr.in](https://wttr.in) for providing free weather info in the terminal.
- Powered by [OpenAI](https://platform.openai.com/docs/guides/gpt) GPT API.

---

##  Contributing

This project is made to be fun and helpful for CLI and Unix beginners.

Feel free to fork, modify, and add your own commands and features! Make it your own personal terminal assistant.

