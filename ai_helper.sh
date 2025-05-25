#! /bin/bash
source .env


if [ -f .env ]; then
  source .env
else
  echo "Missing .env file!"
  exit 1
fi

API_KEY="$xyz"
QUERY="$*"

if [ -z "$QUERY" ]; then
  echo "No query is provided"
  exit 1
fi

# Send the response to ChatGPT API

#prompting can be done when the role is system  
response=$(curl -s https://api.openai.com/v1/chat/completions \
  -H "Authorization: Bearer $API_KEY" \
  -H "Content-Type: application/json" \
  -d @- <<EOF
{
  "model": "gpt-3.5-turbo",
  "messages": [
   
  {"role": "user", "content": "$QUERY"}],
  "temperature": 1,
  "max_tokens": 2048,
  "top_p": 1
}
EOF
)

# Extract and display the assistant's reply
echo "$response" | jq -r '.choices[0].message.content'
