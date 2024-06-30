import openai
from tqdm import tqdm

STEP = 20
INPUT_FILE = "language/kr/FLEET_en.php"
OUTPUT_FILE = "language/kr/FLEET.php"

openai.api_key = ""

with open(INPUT_FILE, "r") as f:
    lines = f.read().split("\n")

for i in tqdm(range(0, len(lines), STEP)):
    text = "\n".join(lines[i:i+STEP])

    if not text:
        continue

    messages = [{
        "role": "system",
        "content": "You are a translator assistant."
    }, {
        "role": "user",
        "content": f"Translate the following text into Korean. Retain the original format. It is written in php programming language, don't translate comments and variables. Return only the translation and nothing else:\n{text}",
    }]

    completion = openai.ChatCompletion.create(
        model="gpt-3.5-turbo",
        messages=messages,
    )

    t_text = completion["choices"][0].get("message").get("content").encode("utf8").decode()

    with open(OUTPUT_FILE, "a", encoding="utf-8") as f:
        f.write(t_text + "\n")

    print(t_text)
