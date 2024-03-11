# Test-TFCD Repository

This repository serves as a demonstration for deploying applications to Rafay projects using `rafay_workload_cd_operator`. Follow the pre-configuration steps below to set up the required environment:

## Pre-Configuration Steps

1. **Create Projects:**
   - In the Rafay console, create three projects: `project1`, `project2`, and `project3`.

2. **Create/Import Clusters:**
   - For each project, create or import clusters as needed.
   - Label the clusters according to the examples provided in the repository.

   Example Labels:
   - To deploy application `echoserver`, label clusters with `"echoserver" = "enabled"`.
   - To deploy application `hello`, label clusters with `"hello" = "enabled"`.
   - To deploy application `httpecho-us`, label clusters with `"httpecho-us" = "enabled"`.
   - To deploy application `httpecho-eu`, label clusters with `"httpecho-eu" = "enabled"`.


   These labels are utilized in the Terraform configurations for deploying workloads.

3. **Create the following namespaces in the clusters:**
   - For the `echoserver` application, create the namespace `ns-echoserver`.
   - For the `hello` application, create the namespace `ns-hello`.
   - For the `httpecho-us` and `httpecho-eu` applications, create the namespace `ns-httpecho`.

## Repository Structure

The repository structure is organized to demonstrate deploying applications to the specified projects. Refer to the examples and configurations within the repository for a better understanding.

Feel free to explore the content and configurations to adapt them to your specific use case.

For any further assistance, refer to the Rafay documentation or reach out to the Rafay support team.

Happy Deploying!


## Quick Start - Deploying Applications from a Repository

The example below demonstrates deploying three applications to projects using the same repository:

1. **echoserver:** Deployed using a chart from a Helm repository.
    - The chart is deployed from a Helm repository to all projects.
    - Set up a Helm repository on the Rafay platform. [Learn more](https://docs.rafay.co/integrations/repositories/overview/)
    - Utilize cluster labels to deploy the workload to specific clusters labeled with `"echoserver" = "enabled"`.

2. **hello:** Deployed using a chart from a Git repository.
    - The chart is deployed from a Git repository to all projects. 
    - Set up a Git repository on the Rafay platform. [Learn more](https://docs.rafay.co/integrations/repositories/overview/)
    - Utilize cluster labels to deploy the workload to specific clusters labeled with `"hello" = "enabled"`.

3. **httpecho-us:** Deployed using a chart from the project folder.
    - Utilize cluster labels to deploy the workload to specific clusters labeled with `"httpecho-us" = "enabled"`.

4. **httpecho-eu:** Deployed using a chart from the project folder.
    - Utilize cluster labels to deploy the workload to specific clusters labeled with `"httpecho-eu" = "enabled"`.


The folder structure for the projects is available on GitHub. You can find it [here](https://github.com/stephan-rafay/test-tfcd.git).

Terraform Configuration
```hcl
resource "rafay_workload_cd_operator" "operatordemo" {
	metadata {
	  name    = "operatordemo"
	  project = "demoorg"
	}
	spec {
	  repo_local_path = "/tmp/application-repo"
	  repo_url        = "https://github.com/stephan-rafay/test-tfcd.git"
	  repo_branch     = "main"
	  credentials {
	    username = var.git_user
	    token = var.git_token
	  }
  
	  workload {
		name = "echoserver"
		chart_helm_repo_name = "echo-server"
		helm_chart_version = "0.5.0"
		helm_chart_name = "echo-server"
		path_match_pattern = "/:project/:workload/:namespace"
		base_path = "echoserver-common"
		include_base_value = true
		delete_action = "delete"
		placement_labels = {
		  "echoserver" = "enabled"
		}
	  }

	  workload {
		name = "hello"
		chart_git_repo_path = "/hello-common/hello-0.1.3.tgz"
		chart_git_repo_branch = "main"   
		helm_chart_version = "0.1.3"
		helm_chart_name = "hello"
		chart_git_repo_name = "hello-repo"
		path_match_pattern = "/:project/:workload/:namespace"
		base_path = "hello-common"
		include_base_value = true
		delete_action = "delete"
		placement_labels = {
		  "hello" = "enabled"
		}
	  }
  
	  workload {
		name = "httpecho-us"
		helm_chart_version = "0.3.4"
		helm_chart_name = "http-echo"
		path_match_pattern = "/:project/:workload/:namespace"
		base_path = "httpecho-common"
		include_base_value = true
		delete_action = "delete"
		placement_labels = {
		  "httpecho-us" = "enabled"
		}
	  }
  
	  workload {
		name = "httpecho-eu"
		helm_chart_version = "0.3.4"
		helm_chart_name = "http-echo"
		path_match_pattern = "/:project/:workload/:namespace"
		base_path = "httpecho-common"
		include_base_value = true
		delete_action = "delete"
		placement_labels = {
		  "httpecho-eu" = "enabled"
		}
	  }	 
	}
	always_run = "${timestamp()}"
  }
```


