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

    
    workload {
      name = "echoserver"
      helm_chart_version = "0.0.2"
      helm_chart_name = "echoserver"
      path_match_pattern = "/:project/:workload/:namespace"
      base_path = "echoserver-common"
      include_base_value = true
      delete_action = "delete"
      placement_labels = {
        "echoserver" = "enabled"
      }
    }

    workload {
      name = "httpecho-us"
      helm_chart_version = "0.3.4"
      helm_chart_name = "http-echo"
      path_match_pattern = "/:project/:workload/:namespace/preview-us"
      base_path = "httpecho-common"
      include_base_value = true
      delete_action = "delete"
      cluster_names = "benny-tfcd-test1"
    }

    workload {
      name = "httpecho-eu"
      helm_chart_version = "0.3.4"
      helm_chart_name = "http-echo"
      path_match_pattern = "/:project/:workload/:namespace/preview-eu"
      base_path = "httpecho-common"
      include_base_value = true
      delete_action = "delete"
      cluster_names = "benny-tfcd-test2"
    }

    workload {
      name = "hello"
      helm_chart_version = "0.1.3"
      helm_chart_name = "hello"
      path_match_pattern = "/:project/:workload/:namespace"
      base_path = "hello-common"
      include_base_value = true
      delete_action = "delete"
      placement_labels = {
        "hello" = "enabled"
      }
    }
   
  }
  always_run = "${timestamp()}"
}
