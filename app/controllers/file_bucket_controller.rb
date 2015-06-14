
class FileBucketController < ApplicationController
  unloadable

  before_filter :find_project_by_project_id, :only => [:index]
  before_filter :authorize

  def index
    settings = RfbProjectSetting.settings_for_project(@project)
    @container_type = settings.active_container_type
    @include_children = settings.subproject_enabled
    @attachments = prepare_attachments(@project, @container_type, @include_children)

    respond_to do |format|
      format.html
      format.json {
        render :json => prepare_attachments(@project, @container_type, @include_children)
      }
    end
  end


  private


  def prepare_attachments(project, container_type, include_children = false)
    where_arr = []
    where_id_arr = []

    container_type.each do |ct|
      case ct
      when 'Project'
        where_arr << "container_type = 'Project' AND container_id IN (?)"

        if include_children
          where_id_arr << project.self_and_descendants.ids
        else
          where_id_arr << [project.id]
        end
      when 'Issue'
        where_arr << "container_type = 'Issue' AND container_id IN (?)"

        if include_children
          where_id_arr << project.self_and_descendants.joins(:issues).pluck('issues.id')
        else
          where_id_arr << project.issue_ids
        end
      when 'Document'
        where_arr << "container_type = 'Document' AND container_id IN (?)"

        if include_children
          where_id_arr << project.self_and_descendants.joins(:documents).pluck('documents.id')
        else
          where_id_arr << project.document_ids
        end
      when 'WikiPage'
        where_arr << "container_type = 'WikiPage' AND container_id IN (?)"

        if include_children
          where_id_arr << project.self_and_descendants.joins(:wiki => :pages).pluck('wiki_pages.id')
        else
          where_id_arr << project.wiki.page_ids
        end
      end
    end

    Attachment.where(where_arr.join(' OR '), *where_id_arr)
  end

end

