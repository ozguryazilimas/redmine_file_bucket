
# File Bucket

It allows you to see files loaded with modules that use in Redmine projects in one page.

This plugin is compatible with Redmine 4.x. If you want to use it with Redmine 3.x please use redmine3 branch.

Compatible with Redmine 4.x and 5.x.


## Supported Modules
** Issues
** Wiki Pages
** Documents
** Projects
** Versions
** News
** Subprojects


## Features

1. It also supports subprojects. Subprojects' files can be included in the parent projects' file list.
2. Plugin is project-based. It is possible to activate or passivate according to project.
3. You can configure file bucket to save different settings for each project.
4. You can set role permissions. You can decide which roles can see the file list or not.
5. As well as the name of the file; where it is uploaded, the size of the file, comment made to file, the page containing the link, subproject attached to, the author, creation date and the number of downloads is also shown.


## Settings

* Plugin settings are accessible at /settings/plugin/redmine_file_bucket address with administration account.
* Modules that scan by file bucket plugin to make a list can be activated or inactivated in the settings page. The modules list to turn on/off:
** Issues
** Wiki Pages
** Documents
** Projects
** Versions
** News
** Subprojects


## Usage

* Plugin is accesssible at /projects/proje_adi/file_bucket address. This adress can also be found in project's menu as the name of 'Plugins'.
* Paging feature has been added to the plugin for more comfortable usage experience.This feature is switched off by selecting 'all' from selection box on the left side.
* It is possible to do instant search on the plugin list (witout page refresh) by using search box on the right top of the page.
* To filtrate file list,you can use selection boxes on the upper section.For example, if you do not want to show subprojects' files, 'sub-projects' option should not be selected. 
* For filtering by file format, write eg. '.jpg' in the search box. In this case, the files in jpg format are listed. If abcd is written in the search box, files that include 'abcd' are listed.
* To remove any file, you can click on the trash icon at the end of the line. This operation also deletes the file where it is added (for example issue).


## License

Copyright (c) 2015, Onur Küçük. Licensed under [GNU GPLv2](LICENSE)


