#!/usr/bin/python
# Setup websites
import json, os, sys, subprocess
#from jinja2 import Template

LOC="/var/website/temp"
BASE_DIR = os.path.abspath(os.path.dirname(__file__))

def sh(cmd):
    c = subprocess.run(cmd.split(" "), capture_output=True)
    if (c.returncode != 0):
        print("sh: error '%s'" % string)
        print(c.stderr.decode("utf-8"))
        sys.exit(1)

class Port():
    p = {
        "tide" : 8080,
    }

    def get(self, kind):
        self.p[kind] += 100
        return self.p[kind]


class Site:
    loc = ""
    url = ""
    remote = ""
    kind = ""
    port = 0
    branch_subdomain = {}

    def __init__(self, loc, url, remote, kind, port):
        self.loc = loc
        self.url = url
        self.remote = remote
        self.kind = kind
        self.port = port

    def add_branch(self, branch, subdomain):
        self.branch_subdomain[branch] = subdomain

    def clone(self):
        sh("mkdir -p %s" % self.loc)
        os.chdir(self.loc)
        for branch in self.branch_subdomain:
            self.branch_clone(branch, self.branch_subdomain[branch])

    def branch_clone(self, branch, subdomain):
        os.chdir(self.loc)
        if os.path.isdir(subdomain):
            os.chdir(subdomain)
            sh("git checkout %s" % branch)
            sh("git pull")
        else:
            sh("git clone %s %s --branch %s" % (self.remote, subdomain, branch))

    def systemd(self):
        os.makedirs(BASE_DIR + "/output~", exist_ok=True)
        template = Template(open(BASE_DIR + "/templates/systemd.service").read())
        template.render(s = self)
        try:
            f = open(BASE_DIR + "/output~/" + self.url, "w")
        except:
            f = open(BASE_DIR + "/output~/" + self.url, "x")
        f.write(str(template))
        f.close()



with open(LOC + "/sites.json") as f:
    data = json.load(f)

sites = []
port = Port()

for s in data:
    d = data[s]

    srv = Site(
        loc = LOC + "/" + s,
        url = d["url"],
        remote = d["remote"],
        kind = d["kind"],
        port = port.get(d["kind"])
    )
    srv.add_branch(d["live"], "live")
    for b, s in d["branch_subdomain"].items():
        srv.add_branch(b, s)
    sites.append(srv)

for s in sites:
    s.clone()
    #s.systemd()

