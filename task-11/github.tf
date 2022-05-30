
#Create new repo

/*
resource "github_repository" "task11" {
  name = var.repo_name
  auto_init = true
  visibility = "public"
}

resource "github_repository_file" "file" {
  count = length(var.list_of_files)

  #repository = github_repository.task11.name
  repository = github_repository.task11.name
  #branch = github_repository.task11.branches.0.name
  file = "task-11/${element(var.list_of_files, count.index)}"
  #content = file("${var.path}/${element(var.list_of_files, count.index)}")
  content = file("${path.cwd}/${element(var.list_of_files, count.index)}")
  commit_message = "Files for TASK-11"
  commit_author = "Evgeny Ermilov"
  commit_email = "e.ermilov@gmail.com"
  overwrite_on_create = true
}

*/


# Uploat files to existen repo

resource "github_repository_file" "file" {
  count = length(var.list_of_files)

  repository = var.repo_name
  branch = "master"
  file = "task-11/${element(var.list_of_files, count.index)}"
  content = file("${path.cwd}/${element(var.list_of_files, count.index)}")
  commit_message = "Files for TASK-11"
  commit_author = "Evgeny Ermilov"
  commit_email = "e.ermilov@gmail.com"
  overwrite_on_create = true
}