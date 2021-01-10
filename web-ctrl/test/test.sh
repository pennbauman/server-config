#!/bin/sh
# Test webhook

curl http://localhost:8070/pennbauman-com/webhook \
	--header "Content-Type: application/json" \
	--header "X-Hub-Signature-256: sha256=a763b988a6148ddf2d9e80f604ff2a05e5d8bb011c04c4bca82bccf49aae55d0" \
	--request POST \
	--data '{
  "ref": "refs/heads/tide",
  "before": "7acc913918bb4a7e6ab5637bb84bac048d1d4d92",
  "after": "99c422d642687a2dc2808263fba014444c3a9d7d",
  "repository": {
    "id": 158505281,
    "node_id": "MDEwOlJlcG9zaXRvcnkxNTg1MDUyODE=",
    "name": "pennbauman.com",
    "full_name": "pennbauman/pennbauman.com",
    "private": false,
    "owner": {
      "name": "pennbauman",
      "email": "pennbauman@protonmail.com",
      "login": "pennbauman",
      "id": 42655736,
      "node_id": "MDQ6VXNlcjQyNjU1NzM2",
      "avatar_url": "https://avatars2.githubusercontent.com/u/42655736?v=4",
      "gravatar_id": "",
      "url": "https://api.github.com/users/pennbauman",
      "html_url": "https://github.com/pennbauman",
      "followers_url": "https://api.github.com/users/pennbauman/followers",
      "following_url": "https://api.github.com/users/pennbauman/following{/other_user}",
      "gists_url": "https://api.github.com/users/pennbauman/gists{/gist_id}",
      "starred_url": "https://api.github.com/users/pennbauman/starred{/owner}{/repo}",
      "subscriptions_url": "https://api.github.com/users/pennbauman/subscriptions",
      "organizations_url": "https://api.github.com/users/pennbauman/orgs",
      "repos_url": "https://api.github.com/users/pennbauman/repos",
      "events_url": "https://api.github.com/users/pennbauman/events{/privacy}",
      "received_events_url": "https://api.github.com/users/pennbauman/received_events",
      "type": "User",
      "site_admin": false
    },
    "html_url": "https://github.com/pennbauman/pennbauman.com",
    "description": "Source files for personal website.",
    "fork": false,
    "url": "https://github.com/pennbauman/pennbauman.com",
    "forks_url": "https://api.github.com/repos/pennbauman/pennbauman.com/forks",
    "keys_url": "https://api.github.com/repos/pennbauman/pennbauman.com/keys{/key_id}",
    "collaborators_url": "https://api.github.com/repos/pennbauman/pennbauman.com/collaborators{/collaborator}",
    "teams_url": "https://api.github.com/repos/pennbauman/pennbauman.com/teams",
    "hooks_url": "https://api.github.com/repos/pennbauman/pennbauman.com/hooks",
    "issue_events_url": "https://api.github.com/repos/pennbauman/pennbauman.com/issues/events{/number}",
    "events_url": "https://api.github.com/repos/pennbauman/pennbauman.com/events",
    "assignees_url": "https://api.github.com/repos/pennbauman/pennbauman.com/assignees{/user}",
    "branches_url": "https://api.github.com/repos/pennbauman/pennbauman.com/branches{/branch}",
    "tags_url": "https://api.github.com/repos/pennbauman/pennbauman.com/tags",
    "blobs_url": "https://api.github.com/repos/pennbauman/pennbauman.com/git/blobs{/sha}",
    "git_tags_url": "https://api.github.com/repos/pennbauman/pennbauman.com/git/tags{/sha}",
    "git_refs_url": "https://api.github.com/repos/pennbauman/pennbauman.com/git/refs{/sha}",
    "trees_url": "https://api.github.com/repos/pennbauman/pennbauman.com/git/trees{/sha}",
    "statuses_url": "https://api.github.com/repos/pennbauman/pennbauman.com/statuses/{sha}",
    "languages_url": "https://api.github.com/repos/pennbauman/pennbauman.com/languages",
    "stargazers_url": "https://api.github.com/repos/pennbauman/pennbauman.com/stargazers",
    "contributors_url": "https://api.github.com/repos/pennbauman/pennbauman.com/contributors",
    "subscribers_url": "https://api.github.com/repos/pennbauman/pennbauman.com/subscribers",
    "subscription_url": "https://api.github.com/repos/pennbauman/pennbauman.com/subscription",
    "commits_url": "https://api.github.com/repos/pennbauman/pennbauman.com/commits{/sha}",
    "git_commits_url": "https://api.github.com/repos/pennbauman/pennbauman.com/git/commits{/sha}",
    "comments_url": "https://api.github.com/repos/pennbauman/pennbauman.com/comments{/number}",
    "issue_comment_url": "https://api.github.com/repos/pennbauman/pennbauman.com/issues/comments{/number}",
    "contents_url": "https://api.github.com/repos/pennbauman/pennbauman.com/contents/{+path}",
    "compare_url": "https://api.github.com/repos/pennbauman/pennbauman.com/compare/{base}...{head}",
    "merges_url": "https://api.github.com/repos/pennbauman/pennbauman.com/merges",
    "archive_url": "https://api.github.com/repos/pennbauman/pennbauman.com/{archive_format}{/ref}",
    "downloads_url": "https://api.github.com/repos/pennbauman/pennbauman.com/downloads",
    "issues_url": "https://api.github.com/repos/pennbauman/pennbauman.com/issues{/number}",
    "pulls_url": "https://api.github.com/repos/pennbauman/pennbauman.com/pulls{/number}",
    "milestones_url": "https://api.github.com/repos/pennbauman/pennbauman.com/milestones{/number}",
    "notifications_url": "https://api.github.com/repos/pennbauman/pennbauman.com/notifications{?since,all,participating}",
    "labels_url": "https://api.github.com/repos/pennbauman/pennbauman.com/labels{/name}",
    "releases_url": "https://api.github.com/repos/pennbauman/pennbauman.com/releases{/id}",
    "deployments_url": "https://api.github.com/repos/pennbauman/pennbauman.com/deployments",
    "created_at": 1542783868,
    "updated_at": "2021-01-06T00:08:31Z",
    "pushed_at": 1610066990,
    "git_url": "git://github.com/pennbauman/pennbauman.com.git",
    "ssh_url": "git@github.com:pennbauman/pennbauman.com.git",
    "clone_url": "https://github.com/pennbauman/pennbauman.com.git",
    "svn_url": "https://github.com/pennbauman/pennbauman.com",
    "homepage": "https://pennbauman.com",
    "size": 12061,
    "stargazers_count": 0,
    "watchers_count": 0,
    "language": "PHP",
    "has_issues": true,
    "has_projects": true,
    "has_downloads": true,
    "has_wiki": true,
    "has_pages": false,
    "forks_count": 0,
    "mirror_url": null,
    "archived": false,
    "disabled": false,
    "open_issues_count": 0,
    "license": {
      "key": "gpl-3.0",
      "name": "GNU General Public License v3.0",
      "spdx_id": "GPL-3.0",
      "url": "https://api.github.com/licenses/gpl-3.0",
      "node_id": "MDc6TGljZW5zZTk="
    },
    "forks": 0,
    "open_issues": 0,
    "watchers": 0,
    "default_branch": "master",
    "stargazers": 0,
    "master_branch": "master"
  },
  "pusher": {
    "name": "pennbauman",
    "email": "pennbauman@protonmail.com"
  },
  "sender": {
    "login": "pennbauman",
    "id": 42655736,
    "node_id": "MDQ6VXNlcjQyNjU1NzM2",
    "avatar_url": "https://avatars2.githubusercontent.com/u/42655736?v=4",
    "gravatar_id": "",
    "url": "https://api.github.com/users/pennbauman",
    "html_url": "https://github.com/pennbauman",
    "followers_url": "https://api.github.com/users/pennbauman/followers",
    "following_url": "https://api.github.com/users/pennbauman/following{/other_user}",
    "gists_url": "https://api.github.com/users/pennbauman/gists{/gist_id}",
    "starred_url": "https://api.github.com/users/pennbauman/starred{/owner}{/repo}",
    "subscriptions_url": "https://api.github.com/users/pennbauman/subscriptions",
    "organizations_url": "https://api.github.com/users/pennbauman/orgs",
    "repos_url": "https://api.github.com/users/pennbauman/repos",
    "events_url": "https://api.github.com/users/pennbauman/events{/privacy}",
    "received_events_url": "https://api.github.com/users/pennbauman/received_events",
    "type": "User",
    "site_admin": false
  },
  "created": false,
  "deleted": false,
  "forced": false,
  "base_ref": null,
  "compare": "https://github.com/pennbauman/pennbauman.com/compare/7acc913918bb...99c422d64268",
  "commits": [
    {
      "id": "99c422d642687a2dc2808263fba014444c3a9d7d",
      "tree_id": "c711fbcb20fe038200fd1ce9be889332cc1684ec",
      "distinct": true,
      "message": "cleaned up routes",
      "timestamp": "2021-01-07T19:49:38-05:00",
      "url": "https://github.com/pennbauman/pennbauman.com/commit/99c422d642687a2dc2808263fba014444c3a9d7d",
      "author": {
        "name": "Penn Bauman",
        "email": "pennbauman@protonmail.com",
        "username": "pennbauman"
      },
      "committer": {
        "name": "Penn Bauman",
        "email": "pennbauman@protonmail.com",
        "username": "pennbauman"
      },
      "added": [

      ],
      "removed": [

      ],
      "modified": [
        "Cargo.lock",
        "Cargo.toml",
        "scripts/build.py",
        "src/apps/core.rs",
        "src/apps/dnd.rs",
        "src/apps/links.rs",
        "src/apps/mod.rs",
        "src/main.rs"
      ]
    }
  ],
  "head_commit": {
    "id": "99c422d642687a2dc2808263fba014444c3a9d7d",
    "tree_id": "c711fbcb20fe038200fd1ce9be889332cc1684ec",
    "distinct": true,
    "message": "cleaned up routes",
    "timestamp": "2021-01-07T19:49:38-05:00",
    "url": "https://github.com/pennbauman/pennbauman.com/commit/99c422d642687a2dc2808263fba014444c3a9d7d",
    "author": {
      "name": "Penn Bauman",
      "email": "pennbauman@protonmail.com",
      "username": "pennbauman"
    },
    "committer": {
      "name": "Penn Bauman",
      "email": "pennbauman@protonmail.com",
      "username": "pennbauman"
    },
    "added": [

    ],
    "removed": [

    ],
    "modified": [
      "Cargo.lock",
      "Cargo.toml",
      "scripts/build.py",
      "src/apps/core.rs",
      "src/apps/dnd.rs",
      "src/apps/links.rs",
      "src/apps/mod.rs",
      "src/main.rs"
    ]
  }
}
'
