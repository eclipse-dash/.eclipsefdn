local orgs = import 'vendor/otterdog-defaults/otterdog-defaults.libsonnet';

orgs.newOrg('technology.dash', 'eclipse-dash') {
  settings+: {
    blog: "https://projects.eclipse.org/projects/technology.dash",
    description: "Tools for Eclipse Committers",
    email: "dash-dev@eclipse.org",
    name: "The Eclipse Dash Project",
    web_commit_signoff_required: false,
    workflows+: {
      actions_can_approve_pull_request_reviews: false,
    },
  },
  secrets+: [
    orgs.newOrgSecret('GITLAB_API_TOKEN') {
      value: "pass:bots/technology.dash/gitlab.eclipse.org/api-token",
    },
  ],
  _repositories+:: [
    orgs.newRepo('.github') {
      allow_merge_commit: true,
      allow_update_branch: false,
      delete_branch_on_merge: false,
      dependabot_alerts_enabled: false,
      web_commit_signoff_required: false,
    },
    orgs.newRepo('dash-licenses') {
      allow_merge_commit: true,
      allow_update_branch: false,
      code_scanning_default_languages+: [
        "java-kotlin"
      ],
      code_scanning_default_setup_enabled: true,
      default_branch: "master",
      delete_branch_on_merge: false,
      dependabot_security_updates_enabled: true,
      description: "Extract license information from content.",
      has_discussions: true,
      homepage: "http://projects.eclipse.org/projects/technology.dash",
      web_commit_signoff_required: false,
    },
    orgs.newRepo('quevee') {
    },
    orgs.newRepo('nodejs-wrapper') {
      allow_merge_commit: true,
      allow_update_branch: false,
      delete_branch_on_merge: false,
      dependabot_alerts_enabled: false,
      description: "This  wrapper makes it easy to integrate and run The Eclipse Dash License Tool in Eclipse Foundation project repositories. ",
      web_commit_signoff_required: false,
    },
  ],
}
