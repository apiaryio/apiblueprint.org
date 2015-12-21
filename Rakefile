namespace :serve do
  sh 'bundle exec middleman server'
end

task :default => :serve

desc 'Deploy the site to GitHub pages'
task :deploy do
  FileUtils.rm_rf '_gh-pages'
  puts 'Cloning gh-pages branch...'
  url = `git ls-remote --get-url origin`
  puts `git clone #{url.strip} _gh-pages`
  Dir.chdir('_gh-pages') do
    puts `git checkout gh-pages`
  end

  Dir.chdir('_gh-pages') do
    puts 'Pulling changes from server.'
    puts `git reset --hard`
    puts `git clean -xdf`
    puts `git checkout gh-pages`
    puts `git pull origin gh-pages`
  end

  puts 'Building site.'
  puts `bundle exec jekyll build -d _gh-pages`

  Dir.chdir('_gh-pages') do
    puts 'Pulling changes from server.'
    puts `git checkout gh-pages`
    puts `git pull origin gh-pages`

    puts 'Creating a commit for the deploy.'

    puts `git ls-files --deleted -z | xargs -0 git rm;`
    puts `git add .`
    puts `git commit -m "Deploy"`

    puts 'Pushing to github.'
    puts `git push --quiet > /dev/null 2>&1`
  end
end
