# <span style="color:red">This project is no longer active.</span>  
## Replaced by: [FHIR R5 Delta Image](https://github.com/NCATS-Tangerine/fhir)
<span style="color:red">This project is scheduled to be deleted.</span>

# ClinicalProfile branch of FHIR Publisher
This repository carries a fork of the main FHIR Publisher build.  The ClinicalProfile branch contains the proposed
JHU/Translator ClinicalProfile Resource.  Changed files:

*  /implementations
    * translations.xml -- (XML Documeent) Added translations for "ClinicalProfile"
* /source
    * compartments.xml -- (Excel Spreadsheet) Added entry for ClinicalProfile in `Resources` tab.  TODO: Needs completion
    * fhir.ini -- adds `ClinicalProfile=clinicalprofile` to resource list, to `cqi` workgroup and as maturity level 0
    * hierarchy.xml -- (XML Document) Adds ClinicalProfile to Quality Reporting page (probably incoreect)
    * resourcelist.html -- Add ClinicalProfile to Specialized Public Health section of Resources page
    * status-codes.xml -- (Excel Document) Added ClinicalProfile status codes.  TODO: Check that these match 
    * /clinicalprofile
        * clinicalprofile-example.xml -- (XML Document) Default example. May not be necessary, but if it is we need
        to make sure we keep it current
        * clinicalprofile-examples-header.xml (HTML Fragment) -- **Documentation for top of examples page.  Needs content!**
        * clinicalprofile-introduction.xml (HTML Fragment) -- **Introduction section for clinical profiles model.  Needs content**
        * clinicalprofile-notes.xml (HTML Fragment) -- **Section that goes after actual model. Needs content**
        * clinicalprofile-spreadsheet.xml (Excel Document) -- Clinical profile model definition. **Definition colum in 
        `Data Elements` tab needs update and clarification**
        * clinicalprofile.gen.svg -- SVG instructions for building UML model.  Refreshed in build
        * sample-profile-5.xml -- Example.  We will want file for every profile we build.  Note that each file needs
        to be added to the `Examples` tab in clinicalprofile-spreadsheet.xml
        * valueset-observation-codes.xml -- (Artifact - should go away)
    * /group
        * group-definition-spreadsheet.xml -- (Excel Document) Need to add a row in `Examples` tab for every population or
        cohort in the profile
        * group-example-clinicalprofile-asthma-population-def.xml -- (XML Document) First cut at definition of asthma population
        * group-example-clinicalprofile-asthma-population-jhu1.xml -- (XML Document) First cut at one JHU realization of asthma population
        * group-example-clinicalprofile-sample-5-cohort-jhu1.xml -- (XML Document) First cut at sample 5 chohort realization
        *  group-example-clinicalprofile-sample-5-cohort.xml -- (XML Document) First cut at sample 5 (35-64 Black or African American Male) definition



### To run the FHIR Publisher

First ensure that [ant 1.9+](http://ant.apache.org/bindownload.cgi) is installed on your system.

1. Run `publish.bat` (windows) or `publish.sh` (OSX/Linux)
2. Wait for it to finish (~10 minutes)

See also: [FHIR Build Process](http://wiki.hl7.org/index.php?title=FHIR_Build_Process)

Note: if you are offline and cannot fetch dependencies, pass the `--offline`
flag to the publisher script. E.g. `./publish.sh --offline`

### To build and run the FHIR Publisher via ant
```
ant clean Publisher -Dargs="-name my-custom-build"
```
---

### Command line parameters to publish.sh / publish.bat

 * `-nogen`: don't generate the spec, just run the validation. (to use this,
   manually fix things in the publication directory, and then migrate the
changes back to source when done. this is a hack)

 * `-noarchive`: don't generate the archive. Don't use this if you're a core
   editor

 * `-web`: produce the HL7 ready publication form for final upload (only core
   editors)

 * `-diff`: the executable program to use if platform round-tripping doesn't
   produce identical content (default: c:\program files
(x86)\WinMerge\WinMergeU.exe)

 * `-name`: the "name" to go in the title bar of each of the specification


---
##### Copyright HL7, Inc.
Open-source under BSD3 (License)[./LICENSE]
