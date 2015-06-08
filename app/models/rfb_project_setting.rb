
class RfbProjectSetting < ActiveRecord::Base
  unloadable

  ATTACHMENT_CONTENT_TYPES = [
    :issue,
    :wiki_page,
    :document,
    :project
  ]

  PROJECT_OPTIONS = [
    :subproject
  ]

  AVAILABLE_OPTIONS = ATTACHMENT_CONTENT_TYPES + PROJECT_OPTIONS

  attr_accessible :project_id, :issue_enabled, :wiki_page_enabled, :document_enabled, :project_enabled,
    :subproject_enabled

  scope :for_project, ->(project) {
    proj_id = project.is_a?(Class) ? project.id : project
    where(:project_id => proj_id)
  }

  scope :settings_for_project, ->(proj_id) {
    for_project(proj_id).first_or_initialize(RedmineFileBucket.settings)
  }

end

