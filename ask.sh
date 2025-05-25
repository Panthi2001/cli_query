#!/bin/bash

# Manual-style help
show_manual() {
  cat <<EOF
CLI Assistant Manual (ask.sh)

Usage:
  ./ask.sh ask         - Start the interactive CLI
  ./ask.sh man         - Show this manual
  ./ask.sh help        - Show available commands directly

Available Commands (inside ask prompt):
  weather              - Show current weather using wttr.in
  weather full         - Show full weather report
  ai                   - Ask AI a question (max 200 chars)
  time                 - Display current system time
  disk                 - Show disk usage
  whoami               - Display current username
  clear                - Clear the terminal screen
  uptime               - Show system uptime
  help                 - Show this help inside CLI
  exit                 - Exit the CLI

Examples:
  ./ask.sh ask
  ask> weather
  ask> ai
  ask> time
  ask> clear
  ask> exit
EOF
}

# Weather functions
show_weather() {
  curl -s wttr.in?format=3
}

show_weather_full() {
  curl -s wttr.in
}

# Ask AI
ask_ai() {
  echo -n "ai: "
  read -r query
  if [ ${#query} -gt 100 ]; then
    echo "Query too long (max 100 chars)."
    return
  fi
  ./ai_helper.sh "$query"
}

# CLI loop
ask_loop() {
  while true; do
    echo -n "ask> "
    read -r cmd
    case "$cmd" in
      "weather full")
        show_weather_full
        ;;
      weather)
        show_weather
        ;;
      time)
        date
        ;;
      disk)
        df -h
        ;;
      whoami)
        whoami
        ;;
      clear)
        clear
        ;;
      ai)
        ask_ai
        ;;
      help)
        show_manual
        ;;
        uptime)
        uptime
        ;;
      exit)
        echo "Bye!"
        break
        ;;
      *)
        echo "Unknown command. Type 'help' for available options."
        ;;
    esac
  done
}

# Entry point
case "$1" in
  ask)
    ask_loop
    ;;
  man|help)
    show_manual
    ;;
  *)
    echo "Usage:"
    echo "  ./ask.sh ask    - Start the CLI"
    echo "  ./ask.sh help   - Show available commands"
    echo "  ./ask.sh man    - Show full manual"
    ;;
esac
