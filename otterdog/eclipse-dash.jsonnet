local orgs = import 'vendor/otterdog-defaults/otterdog-defaults.libsonnet';

orgs.newOrg('eclipse-dash') {
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
  _repositories+:: [
    orgs.newRepo('.github') {
      allow_merge_commit: true,
      allow_update_branch: false,
      delete_branch_on_merge: false,
      dependabot_alerts_enabled: false,
      web_commit_signoff_required: false,
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
