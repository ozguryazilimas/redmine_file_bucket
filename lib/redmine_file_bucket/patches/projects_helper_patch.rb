require_dependency 'projects_helper'

module RedmineFileBucket
  module Patches
    module ProjectsHelperPatch

      def project_settings_tabs
        tabs = super

        if User.current.allowed_to?(:rfb_file_bucket, @project)
          tabs << {
            :name => 'rfb_project_settings',
            :action => :rfb_manage_project_settings,
            :partial => 'projects/rfb_project_settings',
            :label => 'redmine_file_bucket.project_settings.label_file_bucket'
          }
        end

        tabs
      end

    end
  end
end

ProjectsController.helper(RedmineFileBucket::Patches::ProjectsHelperPatch)

