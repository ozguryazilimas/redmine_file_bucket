
class FileBucketController < ApplicationController

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
        render :json => @attachments
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
        if include_children
          found_ids = project.self_and_descendants.ids
        else
          found_ids = [project.id]
        end

        if found_ids.present?
          where_arr << "container_type = 'Project' AND container_id IN (?)"
          where_id_arr << found_ids
        end
      when 'Issue'
        if include_children
          found_ids = project.self_and_descendants.joins(:issues).pluck('issues.id')
        else
          found_ids = project.issue_ids
        end

        if found_ids.present?
          where_arr << "container_type = 'Issue' AND container_id IN (?)"
          where_id_arr << found_ids
        end
      when 'Document'
        if include_children
          found_ids = project.self_and_descendants.joins(:documents).pluck('documents.id')
        else
          found_ids = project.document_ids
        end

        if found_ids.present?
          where_arr << "container_type = 'Document' AND container_id IN (?)"
          where_id_arr << found_ids
        end
      when 'News'
        if include_children
          found_ids = project.self_and_descendants.joins(:news).pluck('news.id')
        else
          found_ids = project.news_ids
        end

        if found_ids.present?
          where_arr << "container_type = 'News' AND container_id IN (?)"
          where_id_arr << found_ids
        end
      when 'WikiPage'
        if include_children
          found_ids = project.self_and_descendants.joins(:wiki => :pages).pluck('wiki_pages.id')
        else
          found_ids = project.wiki.page_ids
        end

        if found_ids.present?
          where_arr << "container_type = 'WikiPage' AND container_id IN (?)"
          where_id_arr << found_ids
        end
      end
    end

    if where_arr.blank? || where_id_arr.blank?
      []
    else
      Attachment.where(where_arr.join(' OR '), *where_id_arr)
    end
  end

end

