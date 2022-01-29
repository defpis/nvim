local present, Comment = pcall(require, "Comment")
if present then
   Comment.setup {}
end

local present, todo_comments = pcall(require, "todo-comments")
if present then
   todo_comments.setup {}
end
