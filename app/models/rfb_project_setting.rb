
class RfbProjectSetting < ActiveRecord::Base
  unloadable

  ATTACHMENT_CONTENT_TYPES = [
    :issue,
    :wiki_page,
    :document,
    :project,
    :version,
    :news
  ]

  PROJECT_OPTIONS = [
    :subproject
  ]

  AVAILABLE_OPTIONS = ATTACHMENT_CONTENT_TYPES + PROJECT_OPTIONS


  attr_accessible :project_id, :subproject_enabled,
    *ATTACHMENT_CONTENT_TYPES.map{|k| "#{k.to_s}_enabled".to_sym}


  scope :for_project, ->(project) {
    proj_id = project.is_a?(Class) ? project.id : project
    where(:project_id => proj_id)
  }

  scope :settings_for_project, ->(proj_id) {
    for_project(proj_id).first_or_initialize(RedmineFileBucket.settings)
  }


  def active_container_type
    active_list = []

    AVAILABLE_OPTIONS.each do |opt|
      symbolized = "#{opt.to_s}_enabled"
      container_type = opt.to_s.titleize.gsub(' ', '')
      active_list << container_type if self.send(symbolized)
    end

    active_list
  end

end

