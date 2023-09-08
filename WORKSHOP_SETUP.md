**Remove this file once you're done with all the changes!**

1. Edit the README.md file: 
    1. Find and replace these values:
        | string               | description                                              |
        |----------------------|----------------------------------------------------------|
        | {{ workshop_name }}  | The name of your workshop, proper. i.e, Advanced Testing |
        | {{ coalesce_year }}  | The year of Coalesce the workshop is for. i.e, 2023      |
        | {{ workshop_intro }} | A fun description of your workshop                       |
        | {{ version }}        | The version of dbt you're building with                  |
    2. Update the Prerequisites section. You can find it easily by searching for the string `{{ update_prereqs }}`
    3. Update the "Bonus" knowledge section. You can find it easily by searching for the string `{{ update_bonus_knowledge }}`
    4. Update the instruction with any _additional_ information needed (i.e, if the participants are starting with an error, let them know!)
       You can find the sections (there's two) to update easily by searching for the string `{{ additional_information }}`
    5. Lastly, do a quick read-through to make sure you don't want to add or change anything else!

2. Edit the dbt_project.yml file on lines 1, 2, and 20. Change anything else, but these are the most important!
3. Are there any packages you need to add? This template repo comes with dbt_utils.

