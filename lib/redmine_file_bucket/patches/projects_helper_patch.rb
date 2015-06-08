require_dependency 'projects_helper'


module RedmineFileBucket
  module Patches
    module ProjectsHelperPatch
      def self.included(base)
        base.extend(ClassMethods)
        base.send(:include, InstanceMethods)
        base.class_eval do
          unloadable
          alias_method_chain :project_settings_tabs, :redmine_file_bucket
        end
      end

      module ClassMethods

      end

      module InstanceMethods

        def project_settings_tabs_with_redmine_file_bucket
          tabs = project_settings_tabs_without_redmine_file_bucket

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
end

