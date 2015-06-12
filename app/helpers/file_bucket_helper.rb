
module FileBucketHelper

  def link_to_attachment_container(attachment)
    case attachment.container_type
    when 'Issue' then
      link_to "[#{attachment.container.tracker.name} ##{attachment.container_id}] #{attachment.container.subject}", issue_path(attachment.container_id)
    when 'Project' then
      link_to attachment.project.name, project_files_path(attachment.container_id)
    when 'Version' then
      link_to attachment.container.name, version_path(attachment.container_id)
    when 'WikiPage' then
      link_to attachment.container.title,
        url_for(:controller => 'wiki',
                :action => 'show',
                :project_id => attachment.project.id,
                :id => Wiki.titleize(attachment.container.title),
                :version => nil
        )
    when 'Document' then
      link_to attachment.container.title, document_path(attachment.container_id)
    when 'News' then
      link_to attachment.container.title, news_path(attachment.container_id)
    else
      ''
    end
  end

  def link_to_attachment_project(attachment)
    link_to attachment.project.name, project_path(attachment.project.id)
  end

end

