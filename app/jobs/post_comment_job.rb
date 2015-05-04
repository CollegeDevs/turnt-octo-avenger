class PostCommentJob
  include SuckerPunch::Job

  def perform(comment)
    @comment = comment
    if @comment.save!
      @comment
    else
      raise NotImplementedError
    end
  end
end
