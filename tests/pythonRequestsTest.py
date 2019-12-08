import requests
print("reading rest...")
r = requests.get("https://data.cityofnewyork.us/resource/fudw-fgrp.json")
print(r.text)