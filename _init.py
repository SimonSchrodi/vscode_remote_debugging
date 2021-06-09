import argparse
from path import Path
import json

parser = argparse.ArgumentParser(description='Setup debugging')
parser.add_argument('--ip', type=str, help='IP address')
parser.add_argument('--port', type=int, help='Port')
parser.add_argument('--path', type=str, help='Path to launch.json')
args = parser.parse_args()

path = Path(args.path)
assert path.exists()

print(f'Set debbuging ip to {args.ip} and port {args.port} in {path}')

with open(path) as f:
    data = json.load(f)

data['configurations'][0]['connect']['host'] = args.ip
data['configurations'][0]['connect']['port'] = args.port

with open(path, 'w') as json_file:
  json.dump(data, json_file, indent=4)
