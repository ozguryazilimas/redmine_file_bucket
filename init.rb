require 'redmine_file_bucket'

Redmine::Plugin.register :redmine_file_bucket do
  name 'Redmine File Bucket plugin'
  author 'Onur Kucuk'
  description 'Redmine plugin to list all files together'
  version '0.9.0'
  url 'http://www.ozguryazilim.com.tr'
  author_url 'http://www.ozguryazilim.com.tr'
  requires_redmine :version_or_higher => '3.0.3'


  project_module :file_bucket do
    permission :rfb_file_bucket, {:projects => [:rfb_project_settings]}, :require => :member
    permission :rfb_file_bucket_view, {:file_bucket => [:index]}, :require => :member
  end

  menu :project_menu,
    :rfb_file_bucket_view,
    {
      :controller => 'file_bucket',
      :action => 'index'
    },
    :caption => :label_file_bucket,
    :after => :new_issue,
    :param => :project_id

  settings :partial => 'redmine_file_bucket/settings',
    :default => {
      :issue_enabled => true,
      :wiki_page_enabled => true,
      :document_enabled => true,
      :project_enabled => true,
      :subproject_enabled => false
    }
end

Rails.configuration.to_prepare do
  [
    [ProjectsController, RedmineFileBucket::Patches::ProjectsControllerPatch],
    [ProjectsHelper, RedmineFileBucket::Patches::ProjectsHelperPatch],
  ].each do |classname, modulename|
    unless classname.included_modules.include?(modulename)
      classname.send(:include, modulename)
    end
  end

end

