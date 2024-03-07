resource "rafay_workload_cd_operator" "operatordemo" {
  metadata {
    name    = "operatordemo"
    project = "demoorg"
  }
  spec {
    repo_local_path = "/tmp/application-repo"
    repo_url        = "https://github.com/stephan-rafay/test-tfcd.git"
    repo_branch     = "main"
    #credentials {
    #  username = var.git_user
    #  token = var.git_token
    #}

    path_match_pattern = "/:project/:namespace/:workload"

    workload {
      chartname = "hello"
      version = "0.1.3"
      base_path = "common"
      placement_labels = {
        "appname" = "echoserver"
      }
      include_base_value = true
      delete_action = var.delete_action_value
    }

  }
  always_run = "${timestamp()}"
}
