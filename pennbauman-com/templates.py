#!/usr/bin/python
# Install pennbauman.com website
import os, sys, json
from jinja2 import Template

LOC = "/root/server-config"
DIR = "/var/website/pennbauman-com"


class Site:
    name = ""
    url = ""
    loc = ""
    port = 0

    def __init__(self, url, loc, port):
        self.name = url.split(",")[0]
        self.url = url
        self.loc = loc
        self.port = port

    def nginx(self):
        os.makedirs(LOC + "/pennbauman-com/.nginx", exist_ok=True)
        template = Template(open(LOC + "/templates/nginx.conf").read())
        f_path = LOC + "/pennbauman-com/.nginx/" + self.name + ".conf"
        try:
            f = open(f_path, "w")
        except:
            f = open(f_path, "x")
        f.write(str(template.render(s = self)))
        f.close()

    def systemd(self):
        os.makedirs(LOC + "/pennbauman-com/.systemd", exist_ok=True)
        template = Template(open(LOC + "/templates/systemd.service").read())
        f_path = LOC + "/pennbauman-com/.systemd/" + self.name + ".service"
        try:
            f = open(f_path, "w")
        except:
            f = open(f_path, "x")
        f.write(str(template.render(s = self)))
        f.close()


# MAIN
with open(sys.argv[1]) as f:
    data = json.load(f)

for d in data:
    site = Site(d["url"], DIR + "/" + d["dir"], d["port"])
    site.nginx()
    site.systemd()

