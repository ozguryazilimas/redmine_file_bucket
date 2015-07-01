
class RfbProjectSetting < ActiveRecord::Base
  unloadable

  LOCALIZED_OPTION_TYPE = {
    'Subproject' => :label_subproject_plural,
    'Issue' => :label_issue,
    'WikiPage' => :label_wiki_page,
    'Document' => :label_document,
    'Project' => :label_project,
    'Version' => :label_version,
    'News' => :label_news
  }

  PERMISSION_FOR_CONTENT = {
    :issue => :view_issues,
    :wiki_page => :view_wiki_pages,
    :document => :view_documents,
    :project => :view_files,
    :version => :view_files,
    :news => :comment_news # view_news is not used much anyway
  }

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
  EDITABLE_ATTRS = AVAILABLE_OPTIONS.map{|k| "#{k.to_s}_enabled".to_sym}


  attr_accessible :project_id, *EDITABLE_ATTRS


  scope :for_project, ->(project) {
    proj_id = project.is_a?(Class) ? project.id : project
    where(:project_id => proj_id)
  }

  scope :settings_for_project, ->(proj_id) {
    for_project(proj_id).first_or_initialize(RedmineFileBucket.settings)
  }

  def allowed_content_types_for_user(proj_id, user = User.current)
    project = Project.find(proj_id)
    user.roles_for_project(project).map{|k| k.permissions}.flatten.uniq
  end

  def active_container_type
    active_list = []
    user_perms = allowed_content_types_for_user(self.send(:project_id))

    AVAILABLE_OPTIONS.each do |opt|
      symbolized = "#{opt.to_s}_enabled"
      container_type = opt.to_s.titleize.gsub(' ', '')

      if self.send(symbolized) && (PROJECT_OPTIONS.include?(opt) || user_perms.include?(PERMISSION_FOR_CONTENT[opt]))
        active_list << container_type
      end
    end

    active_list
  end

  def self.sanitize_settings(settings)
    EDITABLE_ATTRS.each do |attr|
      settings[attr] = false if settings[attr].blank?
    end

    settings
  end

end

