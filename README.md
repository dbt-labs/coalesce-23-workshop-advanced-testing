# ***Archival Notice***
This repository has been archived.

As a result all of its historical issues and PRs have been closed.

Please *do not clone* this repo without understanding the risk in doing so:
- It may have unaddressed security vulnerabilities
- It may have unaddressed bugs

<details>
   <summary>Click for historical readme</summary>

# Coalesce 2023: Advanced Testing Workshop
Welcome to the Advanced Testing workshop of Coalesce 2023!

You've been using dbt for a while, and are comfortable with the out-of-the-box dbt tests:
- unique
- not_null
- accepted_values
- relationships

But... a part of you wonders if there's other tests you should be using. What are some best practices?
dbt Community Slack... documentation... on-demand courses... blog posts... there's so many places and 
such little time!

Well, if you've decided to join us for this workshop - you've come to the right place.  
We'll hold hands and walk through advanced testing concepts together. By the end of it you'll be an 
expert at all the tools at your disposal and can rest easy knowing how to improve your data quality checks.


**Prerequisites** 
This workshop assumes that you're familiar with dbt and at a minimum know how to:
- Apply and run out-of-the-box dbt tests
- Execute dbt commmands
- Use git functionality
- Write basic SQL

It's a bonus if:
- You understand languages like Jinja (templating) or Python (scripting) 
- You've written some basic Jinja or Python statements in the past

# Live Participant Setup Instructions
  
If you'll be joining us live at location, you'll be given access to a project for this
workshop. You can also bring your own dbt Project!

Verify that you're set up and ready to go once you have access to a project:
  
  1. Navigate to the dbt Cloud account
  2. Click the cog in the top right corner and go to **Profile Settings**
  3. Click on **User Profile &gt; Credentials** in the left sidebar
  4. Click on the project name you want to set credentials for
  5. Click **Edit** in the bottom right corner of the pane that opens
  6. Configure your development credentials:
      1. Scroll to the **Development Credentials** section in the pane
      2. Change these configurations:
         | configuration | value                                                                     |
         |---------------|---------------------------------------------------------------------------|
         | schema        | Set this to `dbt_[first_initial][last_name]`. Example: `dbt_cberger`      |
         | target        | Set this to `dev`                                                         |
      3. Click **Save**
  7. Verify your connection:
      1. Click the **Develop** tab in the top menu bar
      2. Create a new branch named `coalesce_[first_initial][lastname]`. Example: `coalesce_cberger`
      3. Run `dbt deps` if needed to install dependencies (you'll be informed via the UI)
      4. Try running `dbt build` from the command bar at the bottom of the UI

# Remote Participant Setup Instructions

Before completing this workshop, there are some prerequisites that you'll need:
1. *A Repository*   
   Ideally, with the files and folders contained in this workshop. To make a copy,
   [fork this repository](https://docs.github.com/en/get-started/quickstart/fork-a-repo).
2. *dbt*
   This workshop is written using dbt Cloud, so a Cloud account is ideal. If using core,
   you'll need to pay attention to the differences to complete this workshop on your own.
  
   Ideally, you'll also want to work with the dbt version this project was built with (dbt v1.6)
   - [upgrade your dbt version](https://docs.getdbt.com/guides/migration/versions/upgrading-to-v1.6)

   Resources:
   - [dbt Cloud Setup](https://docs.getdbt.com/guides/getting-started)
   - [dbt Core Setup](https://docs.getdbt.com/guides/getting-started/learning-more/getting-started-dbt-core)
3. *Some Data*  
   This project is written on top of [Snowflake](https://signup.snowflake.com/)
   and uses the publicly available [TPC-H data set](https://docs.snowflake.com/en/user-guide/sample-data-tpch) 
   which is be included in a Snowflake trial account.

   A truncated version of the data set has also been included in this project as CSV files if you're using a
   different data platform - this is located in the [resources](/_resources/tpch_dataset/) folder.

   **Important**: We don't suggest seeding the CSV files. Though they are truncated, there are still
   a signifcant amount of rows. As a best practice we use seed functionality for small and static datasets
   where seeds are more performant for this specific purpose.
   
   If you don't have a data platform set up yet, don't worry. These guides are great for 
   getting you set up:
   **BigQuery**
   - [Instructions for setting up a free BigQuery account](https://docs.getdbt.com/guides/getting-started/getting-set-up/setting-up-bigquery)  
   - [Instructions for loading CSV files into BigQuery](https://cloud.google.com/bigquery/docs/samples/bigquery-load-table-gcs-csv)  
   - [dbt Cloud quickstart for BigQuery](https://docs.getdbt.com/quickstarts/bigquery?step=1)
   - [Starter instructions](https://relational.fit.cvut.cz/dataset/TPCH) for accessing the TPC-H dataset yourself
   - Instructions for adding the data from this project:
      1. Download each .CSV file from the [`_resources/tpch_dataset`](/_resources/tpch_dataset/) folder
      2. In the BigQuery UI's `Explorer` pane, click the three dots next to your project name 
      2. Click `Create dataset`.
      3. For `Dataset ID`, type `raw_tpch`.
      4. Click `Create dataset`
      5. You should now see your dataset listed under your project name. Click the three dots next to the dataset.
      6. Click `Create table`
      7. Choose `Upload` as the **Create table from** option.
      8. Click `Browse` under `Select file` 
      9. Upload each file you downloaded:
         - For the **table name**, use the file name without the extension. Some file names have `_100mb` appended. Omit this.
         - Make sure to check `Auto detect` under **Schema** 

   **Snowflake**
   - [Instructions for setting up a free Snowflake account](https://docs.snowflake.com/en/user-guide/admin-trial-account#signing-up-for-a-trial-account)
   - [Instructions for viewing the TPCH dataset](https://docs.snowflake.com/en/user-guide/sample-data-using#viewing-the-sample-database)
   - [dbt Cloud quickstart for Snowflake](https://docs.getdbt.com/quickstarts/snowflake?step=1)

 **Verification if using this repository and dbt Cloud**
1. Navigate to your dbt Cloud account
2. Click the cog in the top right corner and go to **Profile Settings**
3. Click on **User Profile &gt; Credentials** in the left sidebar
4. Click on the project name you want to set credentials for
5. Click **Edit** in the bottom right corner of the pane that opens
6. Configure your development credentials:
   1. Scroll to the **Development Credentials** section in the pane
   2. Change these configurations:
      | configuration | value                                                                     |
      |---------------|---------------------------------------------------------------------------|
      | schema        | Set this to `dbt_[first_initial][last_name]`. Example: `dbt_cberger`      |
      | target        | Set this to `dev`                                                         |
   3. Click **Save**
7. Verify your connection:
   1. Click the **Develop** tab in the top menu bar
   2. Create a new branch named `coalesce_[first_initial][lastname]`. Example: `coalesce_cberger`
   3. Run `dbt deps` if needed to install dependencies (you'll be informed via the UI)
   4. Try running `dbt build` from the command bar at the bottom of the UI

# :tada: If you've made it this far, congratulations! :tada:
You're ready to start the workshop! There's nothing else to do until the workshop begins.

# Additional Helpful Links:
- Learn more about dbt [in the docs](https://docs.getdbt.com/docs/introduction)
- Check out [Discourse](https://discourse.getdbt.com/) for commonly asked questions and answers
- Join the [dbt community](http://community.getbdt.com/) for more help and hang with other data practitioners
- Find [dbt events](https://events.getdbt.com) near you
- Check out [the blog](https://blog.getdbt.com/) for the latest news on dbt's development and best practices

