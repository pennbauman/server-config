#!/bin/sh
# Test webhook

curl http://localhost:8070/pennbauman-com/webhook \
	--header "Content-Type: application/json" \
	--request POST \
	--data '{
  "ref": "refs/heads/master",
  "before": "0000000000000000000000000000000000000000",
  "after": "bb711f5318db6593eed8ca00f0ae7d81f9d22dd7",
  "repository": {
    "id": 327445030,
    "node_id": "MDEwOlJlcG9zaXRvcnkzMjc0NDUwMzA=",
    "name": "test",
    "full_name": "pennbauman/test",
    "private": true,
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
    "html_url": "https://github.com/pennbauman/test",
    "description": null,
    "fork": false,
    "url": "https://github.com/pennbauman/test",
    "forks_url": "https://api.github.com/repos/pennbauman/test/forks",
    "keys_url": "https://api.github.com/repos/pennbauman/test/keys{/key_id}",
    "collaborators_url": "https://api.github.com/repos/pennbauman/test/collaborators{/collaborator}",
    "teams_url": "https://api.github.com/repos/pennbauman/test/teams",
    "hooks_url": "https://api.github.com/repos/pennbauman/test/hooks",
    "issue_events_url": "https://api.github.com/repos/pennbauman/test/issues/events{/number}",
    "events_url": "https://api.github.com/repos/pennbauman/test/events",
    "assignees_url": "https://api.github.com/repos/pennbauman/test/assignees{/user}",
    "branches_url": "https://api.github.com/repos/pennbauman/test/branches{/branch}",
    "tags_url": "https://api.github.com/repos/pennbauman/test/tags",
    "blobs_url": "https://api.github.com/repos/pennbauman/test/git/blobs{/sha}",
    "git_tags_url": "https://api.github.com/repos/pennbauman/test/git/tags{/sha}",
    "git_refs_url": "https://api.github.com/repos/pennbauman/test/git/refs{/sha}",
    "trees_url": "https://api.github.com/repos/pennbauman/test/git/trees{/sha}",
    "statuses_url": "https://api.github.com/repos/pennbauman/test/statuses/{sha}",
    "languages_url": "https://api.github.com/repos/pennbauman/test/languages",
    "stargazers_url": "https://api.github.com/repos/pennbauman/test/stargazers",
    "contributors_url": "https://api.github.com/repos/pennbauman/test/contributors",
    "subscribers_url": "https://api.github.com/repos/pennbauman/test/subscribers",
    "subscription_url": "https://api.github.com/repos/pennbauman/test/subscription",
    "commits_url": "https://api.github.com/repos/pennbauman/test/commits{/sha}",
    "git_commits_url": "https://api.github.com/repos/pennbauman/test/git/commits{/sha}",
    "comments_url": "https://api.github.com/repos/pennbauman/test/comments{/number}",
    "issue_comment_url": "https://api.github.com/repos/pennbauman/test/issues/comments{/number}",
    "contents_url": "https://api.github.com/repos/pennbauman/test/contents/{+path}",
    "compare_url": "https://api.github.com/repos/pennbauman/test/compare/{base}...{head}",
    "merges_url": "https://api.github.com/repos/pennbauman/test/merges",
    "archive_url": "https://api.github.com/repos/pennbauman/test/{archive_format}{/ref}",
    "downloads_url": "https://api.github.com/repos/pennbauman/test/downloads",
    "issues_url": "https://api.github.com/repos/pennbauman/test/issues{/number}",
    "pulls_url": "https://api.github.com/repos/pennbauman/test/pulls{/number}",
    "milestones_url": "https://api.github.com/repos/pennbauman/test/milestones{/number}",
    "notifications_url": "https://api.github.com/repos/pennbauman/test/notifications{?since,all,participating}",
    "labels_url": "https://api.github.com/repos/pennbauman/test/labels{/name}",
    "releases_url": "https://api.github.com/repos/pennbauman/test/releases{/id}",
    "deployments_url": "https://api.github.com/repos/pennbauman/test/deployments",
    "created_at": 1609972725,
    "updated_at": "2021-01-06T22:38:45Z",
    "pushed_at": 1609972875,
    "git_url": "git://github.com/pennbauman/test.git",
    "ssh_url": "git@github.com:pennbauman/test.git",
    "clone_url": "https://github.com/pennbauman/test.git",
    "svn_url": "https://github.com/pennbauman/test",
    "homepage": null,
    "size": 0,
    "stargazers_count": 0,
    "watchers_count": 0,
    "language": null,
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
    "license": null,
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
  "created": true,
  "deleted": false,
  "forced": false,
  "base_ref": null,
  "compare": "https://github.com/pennbauman/test/commit/bb711f5318db",
  "commits": [
    {
      "id": "bb711f5318db6593eed8ca00f0ae7d81f9d22dd7",
      "tree_id": "6015b9f19393e2b6973ff3f0bdbbe73b1616a4b8",
      "distinct": true,
      "message": "1",
      "timestamp": "2021-01-06T17:41:09-05:00",
      "url": "https://github.com/pennbauman/test/commit/bb711f5318db6593eed8ca00f0ae7d81f9d22dd7",
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
        "README.md"
      ],
      "removed": [

      ],
      "modified": [

      ]
    }
  ],
  "head_commit": {
    "id": "bb711f5318db6593eed8ca00f0ae7d81f9d22dd7",
    "tree_id": "6015b9f19393e2b6973ff3f0bdbbe73b1616a4b8",
    "distinct": true,
    "message": "1",
    "timestamp": "2021-01-06T17:41:09-05:00",
    "url": "https://github.com/pennbauman/test/commit/bb711f5318db6593eed8ca00f0ae7d81f9d22dd7",
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
      "README.md"
    ],
    "removed": [

    ],
    "modified": [

    ]
  }
}'
