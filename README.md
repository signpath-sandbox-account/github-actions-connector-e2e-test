This repository contains workflows used by SignPath for end-to-end testing of the SignPath integration with GitHub Actions - GitHub Actions Connector. The tests that use these workflows are defined in the connector repository.

In general, one workflow corresponds to one test case. However, this can vary depending on the test implementation. The tests impose requirements on the testing workflows - mainly logging info needed later in the test to verify the test results. To address these requirements, please make sure you call the e2e-workflow-base.yml workflow in your testing workflow.
test-branch
