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

## Repository Structure

The repository structure is organized to demonstrate deploying applications to the specified projects. Refer to the examples and configurations within the repository for a better understanding.

Feel free to explore the content and configurations to adapt them to your specific use case.

For any further assistance, refer to the Rafay documentation or reach out to the Rafay support team.

Happy Deploying!
