#!/usr/bin/env python

from bs4 import BeautifulSoup
import os, subprocess

# Configuration
REMOTE_PATH = "hill:www/pub/znm-vid/"
REMOTE_URL = "https://www.karlin.mff.cuni.cz/~blechta/pub/znm-vid/"
LOCAL_WORKDIR = "./tmp"
FFMPEG_FLAGS = [
    "-n",
    "-threads", "2",
    #"-c:v", "libx264",
    #"-crf", "30",
    #"-preset", "fast",
    #"-c:a", "aac",
    #"-b:a", "128k",
    "-c", "copy",
]

os.makedirs(LOCAL_WORKDIR, exist_ok=True)
with open("index.html", "r", encoding="utf-8") as f:
    soup = BeautifulSoup(f, "html.parser")

links = soup.find_all('a', href=True)
mkv_links = [a for a in links if a['href'].lower().endswith('.mkv')]
link_map = {}

for a in mkv_links:
    url = a['href']
    filename = os.path.basename(url)
    local_mkv = os.path.join(LOCAL_WORKDIR, filename)
    local_mp4 = local_mkv.rsplit(".", 1)[0] + ".mp4"

    # Download MKV
    cmd = ["wget", "-c", "-O", local_mkv, url]
    print(f"Running: {cmd}")
    subprocess.run(cmd, check=True)

    # Convert
    cmd = ["ffmpeg", "-i", local_mkv] + FFMPEG_FLAGS + [local_mp4]
    print(f"Running: {cmd}")
    subprocess.run(cmd, check=True)

    # Upload MP4
    cmd = ["scp", local_mp4, REMOTE_PATH]
    print(f"Running: {cmd}")
    subprocess.run(cmd, check=True)

    # Replace in HTML
    new_url = REMOTE_URL + os.path.basename(local_mp4)
    link_map[url] = new_url
    a['href'] = new_url

## Write modified index.html
#with open("index-patched.html", "w", encoding="utf-8") as f:
#    f.write(str(soup))

# Patch index.html
with open("index.html", "r", encoding='utf-8', newline='') as f:
    html_content = f.read()
for old_url, new_url in link_map.items():
    html_content = html_content.replace(old_url, new_url)
with open("index.html", "w", encoding='utf-8', newline='') as f:
    f.write(html_content)

# Commit change
cmd = ['git', 'add', 'index.html']
print(f"Running: {cmd}")
subprocess.run(cmd, check=True)
cmd = ['git', 'commit', '-m', 'Convert MKV to MP4']
print(f"Running: {cmd}")
subprocess.run(cmd, check=True)

cmd = ['browse', 'index.html']
print(f"Running: {cmd}")
subprocess.run(cmd, check=True)

print("Check and run 'git push'")
