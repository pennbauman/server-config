#!/usr/bin/python
# Setup websites
import json, os, sys, subprocess
#from jinja2 import Template
import toml

LOC="/var/website/temp"
BASE_DIR = os.path.abspath(os.path.dirname(__file__))

def sh(cmd):
    c = subprocess.run(cmd.split(" "), capture_output=True)
    if (c.returncode != 0):
        print("sh: error '%s'" % cmd)
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

    def __init__(self, loc, url, remote, kind, port, bs={}):
        self.loc = loc
        self.url = url
        self.remote = remote
        self.kind = kind
        self.port = port
        self.branch_subdomain = bs

    def add_branch(self, branch, subdomain):
        if subdomain == "prod":
            url = self.url
        else:
            url = subdomain + "." + self.url
        self.branch_subdomain[branch] = Site(
                loc = self.loc + "/" + subdomain,
                url = url,
                remote = self.remote + ":" + branch,
                kind = self.kind,
                port = self.port + len(self.branch_subdomain) + 1,
                bs = None,
            )

    def clone(self):
        sh("mkdir -p %s" % self.loc)
        os.chdir(self.loc)
        for branch in self.branch_subdomain:
            self.clone_branch(branch, self.branch_subdomain[branch].loc)

    def clone_branch(self, branch, loc):
        if os.path.isdir(loc):
            os.chdir(loc)
            sh("git checkout %s" % branch)
            sh("git pull")
        else:
            sh("git clone %s %s --branch %s" % (self.remote, loc, branch))


    def build(self):
        for branch in self.branch_subdomain:
            self.build_branch(self.branch_subdomain[branch].loc, self.branch_subdomain[branch].url)

    def build_branch(self, loc, url):
        if self.kind == "tide":
            os.chdir(loc)
            with open(loc + "/Cargo.toml") as f:
                data = toml.load(f)
            print("rust build ... ", end="")
            sh("cargo build --release")
            print("done")

            try:
                f = open(LOC + "/cp.txt", "a")
            except:
                f = open(LOC + "/cp.txt", "x")
            f.write("target/release/" + data["package"]["name"] + " /bin/" + url)
            f.close()
        else:
            raise Exception("Unknown site type")


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
    #s.systemd()

