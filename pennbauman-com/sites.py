#!/usr/bin/python
# Setup websites
import json, os, sys, subprocess
from jinja2 import Template
import toml

LOC="/var/website/temp"
BASE_DIR = os.path.abspath(os.path.dirname(__file__))

def sh(cmd):
    c = subprocess.run(cmd.split(" "), capture_output=True)
    if (c.returncode != 0):
        print("sh: error '%s'" % cmd)
        print(c.stderr.decode("utf-8"))
        sys.exit(1)

def cp(source, target):
    try:
        f = open(LOC + "/cp.txt", "a")
    except:
        f = open(LOC + "/cp.txt", "x")
    f.write(source + " " + target + "\n")
    f.close()

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
    branches = {}

    def __init__(self, loc, url, remote, kind, port, bs={}):
        self.loc = loc
        self.url = url
        self.remote = remote
        self.kind = kind
        self.port = port
        self.branches = bs

    def add_branch(self, branch, subdomain):
        if subdomain == "prod":
            url = self.url
        else:
            url = subdomain + "." + self.url
        self.branches[branch] = Site(
                loc = self.loc + "/" + subdomain,
                url = url,
                remote = self.remote + ":" + branch,
                kind = self.kind,
                port = self.port + len(self.branches),
                bs = None,
            )

    def clone(self, branch = ""):
        if self.branches == None:
            if os.path.isdir(self.loc):
                os.chdir(self.loc)
                sh("git checkout %s" % branch)
                sh("git pull")
            else:
                sh("git clone %s %s --branch %s" % (self.remote, self.loc, branch))
        else:
            sh("mkdir -p %s" % self.loc)
            os.chdir(self.loc)
            for b, s in self.branches.items():
                s.clone(b)


    def build(self):
        if self.branches == None:
            if self.kind == "tide":
                os.chdir(self.loc)
                with open(self.loc + "/Cargo.toml") as f:
                    data = toml.load(f)
                print("rust build ... ", end="")
                sh("cargo build --release")
                print("done")
                cp(self.loc + "/target/release/" + data["package"]["name"], "/bin/" + self.url)
            else:
                raise Exception("Unknown site type")
        else:
            for branch in self.branches.values():
                branch.build()


    def systemd(self):
        os.makedirs(LOC + "/.systemd", exist_ok=True)
        if self.branches == None:
            template = Template(open(BASE_DIR + "/.templates/systemd.service").read())
            try:
                f = open(LOC + "/.systemd/" + self.url, "w")
            except:
                f = open(BASE_DIR + "/.systemd/" + self.url, "x")
            f.write(str(template.render(s = self)))
            f.close()
            cp(BASE_DIR + "/.systemd/" + self.url, "/etc/systemd/system/" + self.url + ".service")
        else:
            for branch in self.branches.values():
                branch.systemd()

    def nginx(self):
        os.makedirs(LOC + "/.nginx", exist_ok=True)
        if self.branches == None:
            template = Template(open(BASE_DIR + "/.templates/nginx.conf").read())
            try:
                f = open(LOC + "/.nginx/" + self.url, "w")
            except:
                f = open(BASE_DIR + "/.nginx/" + self.url, "x")
            f.write(str(template.render(s = self)))
            f.close()
            cp(BASE_DIR + "/.nginx/" + self.url, "/etc/nginx/conf.d/" + self.url + ".conf")
        else:
            for branch in self.branches.values():
                branch.nginx()


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
            port = port.get(d["kind"]),
        )
    srv.add_branch(d["prod"], "prod")
    for b, s in d["branch_subdomain"].items():
        srv.add_branch(b, s)
    sites.append(srv)

for s in sites:
    if (len(sys.argv) < 2) or (sys.argv[1] == "clone"):
        s.clone()
    elif sys.argv[1] == "build":
        s.build()
    elif sys.argv[1] == "systemd":
        s.systemd()
    elif sys.argv[1] == "nginx":
        s.nginx()

